package com.ez.ezBears.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

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

import com.ez.ezBears.board.model.BoardService;
import com.ez.ezBears.board.model.BoardVO;
import com.ez.ezBears.common.ConstUtil;
import com.ez.ezBears.common.FileUploadUtil2;
import com.ez.ezBears.common.PaginationInfo;
import com.ez.ezBears.common.SearchVO;

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
	    // 랜덤 값을 저장하는 로직
	    //saveRandomNumber(randomNumber);

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
    public String boardWrite_post(BoardVO boardVo,
    		HttpServletRequest request, HttpSession session, Model model) {
        logger.info("글 등록 파라미터 boardVo={}", boardVo);
        String msg = "등록 실패";
        String url = "/board/boardWrite";
        
        //db에서 모든 숫자를 가져온다
        List<Map<String, Object>>list=boardService.boardAll();
        
		/*
		 * //그 db에 담겨있는 숫자들을 미리 난수를 생성하기전에 그 숫자들을 제외한 숫자중에 생성을 한다. for(Map<String,
		 * Object> map:list) { int boardnum=(int)map.get("BOARDNUM");
		 * 
		 * 
		 * 
		 * }
		 */
        
        List<Integer> boardnumList = new ArrayList<>();
        for(Map<String, Object> map : list) {
            int boardnum = (int) map.get("BOARDNUM");
            boardnumList.add(boardnum);
        }

        int uniqueRandomNumber;
        do {
        	uniqueRandomNumber = generateUniqueRandomNumber(1, 5, boardnumList); // 범위를 알맞게 수정
        } while (boardnumList.contains(uniqueRandomNumber));
        
        
        try {
            List<Map<String, Object>> files = fileUploadUtil.fileupload(request, ConstUtil.UPLOAD_NOTICE_FLAG);
            logger.info("업로드파일 정보 files={}", files);

           
        	int cnt = boardService.insertBoard(boardVo);
        	logger.info("공지사항 등록 결과 cnt = {}", cnt);
        	msg="등록 성공";
			/*
				 * else { //전체조회 List<Map<String, Object>>list=boardService.boardAll(); //랜덤num
				 * for문안에서 비교 for(Map<String, Object> map: list) { int
				 * boardnum=(int)map.get("BOARDNUM"); if(randomNo==boardnum) { //새로운 랜덤함수 생성 int
				 * uniqueRandomNumber = generateUniqueRandomNumber(1, 10);
				 * boardVo.setRandomnum(uniqueRandomNumber); } } //같은게있으면 새로운 변수생성 int cnt =
				 * boardService.insertBoard(boardVo); logger.info("공지사항 등록 결과 cnt = {}", cnt);
				 * msg="등록 성공"; }
				 */

           // ... (메시지 및 URL 설정)
        } catch (IllegalStateException e) {
            e.printStackTrace();
		} catch (IOException e){ 
			e.printStackTrace(); 
		}
			

        model.addAttribute("msg", msg);
        model.addAttribute("url", url);

        return "common/message"; // 메시지 출력 페이지로 이동
    }

    
    private int generateUniqueRandomNumber(int min, int max, List<Integer> boardnumList) {
        Set<Integer> usedRandomNumbers = new HashSet<>(boardnumList);
        int randomNumber;
        int totalPossibleNumbers = max - min + 1 - usedRandomNumbers.size(); // 총 가능한 숫자 개수
        if (totalPossibleNumbers <= 0) {
            throw new IllegalStateException("No unique random number can be generated.");
        }
        
        do {
            randomNumber = min + (int) (Math.random() * (max - min + 1));
        } while (usedRandomNumbers.contains(randomNumber));
        
        return randomNumber;
    }
    
	/*
	 * // 고유한 랜덤 숫자 생성 함수 private int generateUniqueRandomNumber(int min, int max) {
	 * Set<Integer> usedRandomNumbers = new HashSet<>(); int randomNumber; do {
	 * randomNumber = min + (int) (Math.random() * (max - min + 1)); } while
	 * (usedRandomNumbers.contains(randomNumber));
	 * usedRandomNumbers.add(randomNumber); return randomNumber; }
	 */
}
