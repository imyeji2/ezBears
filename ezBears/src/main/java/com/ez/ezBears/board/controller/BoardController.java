package com.ez.ezBears.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ez.ezBears.board.model.BoardFileVO;
import com.ez.ezBears.board.model.BoardService;
import com.ez.ezBears.board.model.BoardVO;
import com.ez.ezBears.common.ConstUtil;
import com.ez.ezBears.common.FileUploadUtil2;
import com.ez.ezBears.common.PaginationInfo;
import com.ez.ezBears.common.SearchVO;
import com.ez.ezBears.member.model.MemberVO;
import com.ez.ezBears.notice.model.NoticeVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
    private final BoardService boardService; // BoardService는 실제 서비스 로직을 구현한 서비스 클래스
    private final FileUploadUtil2 fileUploadUtil;
    
    private static final String[] KOREAN_SYLLABLES = {
            "무지", "라이언", "어피치", "프로도", "네오", "콘", "튜브", "제이지", "호걸이", "호연이",
            "철웅이", "누리", "아라", "피니", "블레오", "핑크레오", "레니", "라온", "랜디", "단디",
            "쎄리", "럭키", "스타", "빅", "또리", "돔돔이", "턱돌이", "동글이", "위니", "비니",
            "수리",
            // 나머지 한글 음절들도 추가
    };
    
    
    @RequestMapping("/boardList")
	public String boardList(@RequestParam(defaultValue = "0") int boardNo,
			@ModelAttribute SearchVO searchVo,Model model) {
		logger.info("공지사항 리스트 페이지 파라미터 boardNo={}",boardNo);
		logger.info("공지사항 검색 파라미터 searchVo={}", searchVo);

		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT_FIVE);

		//2)searchVo에 값 세팅 -> xml에 전달할 값 
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT_FIVE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		//2
		//List<Map<String, Object>> list=noticeService.selectNoticeList(noticeNo);
		List<Map<String, Object>> list=boardService.selectAllBoard(searchVo);
		logger.info("공지사항 리스트 페이지 결과 list.size={}",list.size());

		int totalCount = boardService.selectTotalCount(searchVo);
		pagingInfo.setTotalRecord(totalCount);
		logger.info("totalCount={}",totalCount);


		//3
		model.addAttribute("list",list);
		model.addAttribute("pagingInfo",pagingInfo);
		return "board/boardList";
	}
	
	@ResponseBody
	@RequestMapping("/board_ajax")
	public Map<String, Object> board_ajax(SearchVO searchVo) {
	    //1.
	    logger.info("팀 공지사항 리스트 페이지, 파라미터 searchVo={}",searchVo);

	    //2
	    //페이징 처리
	    //[1]PaginationInfo 객체 생성
	    PaginationInfo pagingInfo = new PaginationInfo();
	    pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
	    pagingInfo.setCurrentPage(searchVo.getCurrentPage());
	    pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT_FIVE);
	    
	    //2)searchVo에 값 세팅 -> xml에 전달할 값 
	    searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT_FIVE);
	    searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
	    
	    //2
	    List<Map<String, Object>> list = boardService.selectAllBoard(searchVo);
	    logger.info("공지사항 리스트 페이지 결과 list.size={}", list.size());
	    
	    int totalCount = boardService.selectTotalCount(searchVo);
	    pagingInfo.setTotalRecord(totalCount);
	    logger.info("totalCount={}", totalCount);
	    
	    //3

	    Map<String, Object> resultMap = new HashMap<>();
	    resultMap.put("list", list);
	    resultMap.put("pagingInfo", pagingInfo);

	    //4
	    return resultMap;
	}
	
	@GetMapping("/boardWrite")
	public String boardWrite() {
		logger.info("공지사항 등록하기 페이지");
		return "board/boardWrite";
	}
    
    
	@PostMapping("/boardWrite")
    public String boardWrite_post(@ModelAttribute BoardVO boardVo, HttpServletRequest request,
    		@RequestParam(defaultValue = "0") String pwd,
            HttpSession session, Model model) {
        logger.info("글 등록 파라미터 boardVo={}", boardVo);
        String msg = "등록 실패";
        String url = "/board/boardWrite";


        String randomKoreanId = generateRandomKoreanId(1); // 2자의 한글 음절로 된 랜덤 아이디 생성
        //길이가 2인 랜덤 한글 아이디를 생성하는 메서드를 호출하여 randomKoreanId 변수에 저장
        logger.info("랜덤아이디 생성 확인 randomKoreanId={}",randomKoreanId);
        
        List<Map<String, Object>> list = boardService.boardAll();
        //게시글의 랜덤 번호를 모두 가져오는 메서드를 호출하여 리스트를 list 변수에 저장
        logger.info("랜덤함수카운트 list.size={}", list.size());
        
        boolean isRandomNumberValid = false;
        //랜덤 번호가 유효한지 여부를 나타내는 변수를 초기화

        while (!isRandomNumberValid) {//랜덤 번호가 유효하게 될 때까지 반복
            int existingRandomIdCount = boardService.checkExistingRandomId(randomKoreanId);
            //현재 랜덤 번호가 데이터베이스에 이미 존재하는지 확인하기 위해 해당 랜덤 번호로 등록된 글 개수를 가져옴
            if (existingRandomIdCount > 0) {//만약 랜덤 번호가 이미 존재한다면, 다시 새로운 랜덤 번호를 생성
                randomKoreanId = generateRandomKoreanId(2);
            } else {//랜덤 번호가 존재하지 않는 경우, 랜덤 번호가 유효하다고 표시하고 루프를 종료
                isRandomNumberValid = true;
            }
        }

        try {
            List<Map<String, Object>> files = fileUploadUtil.fileupload(request, ConstUtil.UPLOAD_BOARD_FLAG);
            logger.info("업로드파일 정보 files={}", files);

            boardVo.setRandomId(randomKoreanId);
            boardVo.setRandomPwd(pwd);
            int cnt = boardService.insertBoard(boardVo);
            logger.info("boardVo 결과 boardVo = {}", boardVo);
            logger.info("공지사항 등록 결과 cnt = {}", cnt);
            
            
            if(cnt>0) {
				int cnt2=boardService.insertFileBoard(files, boardVo.getBoardNo());
				msg = "등록 성공";
	            url = "/board/boardList";
			}

            // ... (메시지 및 URL 설정)
        } catch (IllegalStateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        model.addAttribute("msg", msg);
        model.addAttribute("url", url);

        return "common/message"; // 메시지 출력 페이지로 이동
    }

    private String generateRandomKoreanId(int length) { //주어진 길이만큼의 랜덤 한글 아이디를 생성하는 메서드
        StringBuilder idBuilder = new StringBuilder();
        Random random = new Random();

        for (int i = 0; i < length; i++) {
            int randomIndex = random.nextInt(KOREAN_SYLLABLES.length); //배열에서 임의의 음절을 선택하여 아이디를 구성
            idBuilder.append(KOREAN_SYLLABLES[randomIndex]);
        	//char syllable = (char) (0xAC00 + random.nextInt(11172)); // 유효한 한글 음절 범위
            //idBuilder.append(syllable);
        }

        return idBuilder.toString();
    }
    
    
    @RequestMapping("/Filedownload")
	public ModelAndView downloadFile(@RequestParam(defaultValue = "0") int boardNo,@RequestParam(defaultValue = "0") int boardFileNo,
			@RequestParam String fileName,HttpServletRequest request) {

		logger.info("공지사항 파일 다운로드 파라미터 boardNo={}, fileName={},boardFileNo={}",boardNo, fileName,boardFileNo);
		
		int cnt=boardService.updateDowncount(boardFileNo);
		logger.info("다운로드 수 증가, 결과 cnt={}", cnt);
		
		Map<String, Object> map = new HashMap<>();
		
		String upPath = fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_BOARD_FLAG);
		File file = new File(upPath, fileName);
		map.put("file", file);

		//ModelAndView(String viewName, Map<String, ?> model)
		ModelAndView mav = new ModelAndView("DownloadView", map);
		return mav;
	}

    
    @RequestMapping("/boardDetail")
	public String boardDetail(@ModelAttribute BoardVO boardVo,@RequestParam(defaultValue = "0") int boardNo, 
			Model model, HttpSession session) {
		//1
		logger.info("자유게시판 디테일 화면 파라미터 boardNo={}",boardNo);

		
		String userid=(String)session.getAttribute("userid");
		logger.info("공지사항 아이디 userid={}",userid);
		 

		//2
		Map<String, Object> map=boardService.selectDetail(boardNo);
		logger.info("자유게시판 결과 map={}",map);

		List<Map<String, Object>> list=boardService.selectBoardList(boardNo);
		logger.info("자유게시판 리스트 페이지 결과 list.size={}",list.size());

		List<Map<String, Object>>filemap=boardService.selectBoardFile(boardNo);
		logger.info("자유게시판 리스트 파일 결과 filemap={}",filemap);

		List<Map<String, Object>>nextPage=boardService.nextPage(boardNo);
		logger.info("이전페이지 결과 nextPage={}",nextPage);

		//3.
		model.addAttribute("map",map);
		model.addAttribute("userid",userid);
		model.addAttribute("list",list);
		model.addAttribute("filemap",filemap);
		model.addAttribute("nextPage",nextPage);

		return "board/boardDetail";
	}
    
    
    @GetMapping("/boardEdit")
	public String boardEdit(@ModelAttribute MemberVO memberVo,@ModelAttribute BoardFileVO boardFileVo,
			@RequestParam (defaultValue = "0") int boardNo,Model model, HttpSession session) {
		//1
		String userid = (String)session.getAttribute("userid");
		String type="edite";
		logger.info("공지사항 수정 페이지 boardFileVo={},userid={},boardNo={}",boardFileVo,userid,boardNo);

		//2
		memberVo.setMemId(userid);

		Map<String, Object>map=boardService.selectDetail(boardNo);
		List<Map<String, Object>> list=boardService.selectBoardFile(boardNo);

		logger.info("공지사항 디테일 map={}",map);
		logger.info("파일 list.size={}",list);

		//3
		model.addAttribute("map",map);
		model.addAttribute("list",list);
		model.addAttribute("memberVo",memberVo);
		model.addAttribute("boardNo",boardNo);
		model.addAttribute("type",type);

		//4
		return "/board/boardWrite";
	}


    @PostMapping("/boardEdit")
	public String boardEdit_post(@ModelAttribute BoardVO boardVo,
			@RequestParam(defaultValue = "0") int boardNo,
			@RequestParam(required = false) String oldFileName,
			HttpServletRequest request, Model model) {
		//1
		logger.info("공지사항 수정 처리 파라미터 boardVo={},boardNo={}",boardVo,boardNo);


		int cnt = boardService.updateboard(boardVo);
		logger.info("팀별 공지사항 수정 결과 cnt={}",cnt);

		if(oldFileName!=null) {
			boardService.deleteBoardFile(boardNo);
		}

		String fileName="", originalFileName="";
		List<Map<String, Object>> files;

		try {
			files = fileUploadUtil.fileupload(request, ConstUtil.UPLOAD_BOARD_FLAG);
			logger.info("업로드파일 정보 files={}", files);


			//2
			String msg="공지사항 글 수정 실패";
			String url="/board/boardEdit?boardNo="+boardNo;

			if(cnt>0) {
				int cnt2=boardService.insertFileBoard(files, boardVo.getBoardNo());
				logger.info("다중파일 업로드 결과 cnt2={}",cnt2);
				
				msg="공지사항 글 수정 성공";
				url="/board/boardDetail?boardNo="+boardNo;

				if(files!=null && !files.isEmpty()) { //
					if(oldFileName!=null && !oldFileName.isEmpty()) {//
						String upPath
						=fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_BOARD_FLAG);
						File file= new File(upPath,oldFileName);
						if(file.exists()) {
							boolean bool=file.delete();
							logger.info("글 수정- 파일삭제 여부:{}", bool);
						}
					}
				}
			}//if

			
			
			//3
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);

		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		//4
		return "common/message";
	}
    

    @RequestMapping("/boardDelte")
	public String boardDelte(@RequestParam (defaultValue = "0") int boardNo, 
			Model model, HttpServletRequest request) {
		logger.info("공지사항 삭제 매개변수 boardNo={}",boardNo);

		//NoticeVO noticeVo=noticeService.selectnoticeByNo(noticeNo);
		List<Map<String, Object>> fileList=boardService.selectboardFileByNo(boardNo);

		int cnt=boardService.deleteBoard(boardNo);
		logger.info("공지사항 삭제 결과 cnt={}",cnt);
		boardService.deleteBoardFile(boardNo);

		String msg="삭제 성공";
		String url="/board/boardList";

		for (Map<String, Object> fileMap : fileList) {
			String oldFileName = (String) fileMap.get("FILE_NAME"); // 맵에서 파일 이름 가져오기

			if (oldFileName != null && !oldFileName.isEmpty()) {
				String upPath = fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_BOARD_FLAG);
				File file = new File(upPath, oldFileName);
				if (file.exists()) {
					boolean bool = file.delete();
					logger.info("파일 삭제 여부 : {}", bool);
				}
			}
		}


		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

}
