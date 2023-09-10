package com.ez.ezBears.temNotice.controller;
import java.io.File;
import java.io.IOException;
import java.lang.ProcessHandle.Info;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.ez.ezBears.common.ConstUtil;
import com.ez.ezBears.common.FileUploadUtil;
import com.ez.ezBears.common.MyBoardSearchVo;
import com.ez.ezBears.common.PaginationInfo;
import com.ez.ezBears.common.SearchVO;
import com.ez.ezBears.member.model.MemberService;
import com.ez.ezBears.myBoard.controller.MyBoardController;
import com.ez.ezBears.myBoard.model.MyBoardListService;
import com.ez.ezBears.myBoard.model.MyBoardListVO;
import com.ez.ezBears.myBoard.model.MyBoardVO;
import com.ez.ezBears.temNotice.model.TeamNoticeService;
import com.ez.ezBears.temNotice.model.TeamNoticeVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/myBoard")
@RequiredArgsConstructor
public class TeamNoticeController {
	private static final Logger logger = LoggerFactory.getLogger(MyBoardController.class);
	private final MyBoardListService myBoardListService;
	private final MemberService memberService;
	private final FileUploadUtil fileUploadUtil;	
	private final TeamNoticeService teamNoticeService;
	
	//예지
	/*팀별 공지사항 게시판 리스트 */
	@RequestMapping("/teamNotice")
	public String teamNotice(@RequestParam (defaultValue = "0") int mBoardNo, 
			MyBoardSearchVo searchVo,Model  model) {
		//1.
		logger.info("팀 공지사항 리스트 페이지, 파라미터 mBoardNo={},searchVo={}",mBoardNo,searchVo);
		
		if(mBoardNo==0) {
			model.addAttribute("msg","잘못된 접근입니다.");
			model.addAttribute("url","/");
			return "common/message";
		}
		
		
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
		
		List<Map<String, Object>> list = teamNoticeService.selectTeamNoticeList(searchVo);
		logger.info("팀 공지사항 리스트 조회 결과 list.size={}",list.size());
		
		int totalCount = teamNoticeService.selectTotalCount(searchVo);
		pagingInfo.setTotalRecord(totalCount);
		logger.info("totalCount={}",totalCount);
		
		//3
		model.addAttribute("list",list);
		model.addAttribute("mBoardNo",mBoardNo);
		model.addAttribute("pagingInfo",pagingInfo);
		
		//4
		return "myBoard/teamNoticeList";
	}
	
	@ResponseBody
	@RequestMapping("/teamNotice_ajax")
	public Map<String, Object> teamNotice_ajax(@RequestParam (defaultValue = "0") int mBoardNo, 
			MyBoardSearchVo searchVo) {
		//1.
		logger.info("팀 공지사항 리스트 페이지, 파라미터 mBoardNo={},searchVo={}",mBoardNo,searchVo);
		
		
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
		
		List<Map<String, Object>> list = teamNoticeService.selectTeamNoticeList(searchVo);
		logger.info("팀 공지사항 리스트 조회 결과 list.size={}",list.size());
		
		int totalCount = teamNoticeService.selectTotalCount(searchVo);
		pagingInfo.setTotalRecord(totalCount);
		logger.info("totalCount={}",totalCount);
		
		//3
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("list", list);
		resultMap.put("mBoardNo", mBoardNo);
		resultMap.put("pagingInfo", pagingInfo);

		
		//4
		return resultMap;
	}
	
	//팀별 공지사항 글 등록 화면
	@GetMapping("/teamNoticeWrite")
	public String teamNoticeWrite(@ModelAttribute MyBoardListVO myBoardListVo,
			Model model, HttpSession session) {
		//1.
		logger.info("팀 공지사항 등록하기 페이지");
		
		String userid=(String)session.getAttribute("userid");
		String type="write";
		
		logger.info("팀 동지사항 등록 페이지 파라미터 myBoardListVo={},userid={}",myBoardListVo,userid);
		
		//2
		myBoardListVo.setMemId(userid);
		myBoardListVo=myBoardListService.selectMyBoardInfo(myBoardListVo);
		logger.info("팀 게시판 정보 찾기 결과 myBoardListVo={}",myBoardListVo);

		//3.
		model.addAttribute("myBoardListVo",myBoardListVo);
		model.addAttribute("type",type);

		//4.
		return "myBoard/teamNoticeWrite";
	}
	
	
	//팀별 공지사항 글 등록
	@PostMapping("/teamNoticeWrite")
	public String teamNoticeWrite_post(@ModelAttribute TeamNoticeVO teamNoticeVo,
			@RequestParam(defaultValue = "0") int mBoardNo,HttpServletRequest request, Model model) {
		
		//1
		logger.info("팀 공지사항 등록, 파라미터 TeamNoticeVO={}",teamNoticeVo);
		
		try {
			List<Map<String, Object>> fileList
			=fileUploadUtil.fileupload(request, ConstUtil.UPLOAD_TEAMNOTICE_FLAG);

			String fileName="", originalFileName="";
			long fileSize = 0;
			for(Map<String, Object> map : fileList) {
				fileName=(String) map.get("fileName");
				originalFileName=(String) map.get("originalFileName");
				fileSize= (long) map.get("fileSize");				
			}//for

			teamNoticeVo.setFileName(fileName);
			teamNoticeVo.setOriginname(originalFileName);
			teamNoticeVo.setFsize(fileSize);	
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		int cnt=teamNoticeService.insertTeamNotice(teamNoticeVo);
		logger.info("글쓰기 결과, cnt={}", cnt);
		logger.info("글쓰기 결과, teamNoticeVo={}", teamNoticeVo);
		
		//3
		//4
		return "redirect:/myBoard/teamNotice?mBoardNo="+mBoardNo;
	}
	
	
	//공지사항 조회수 증가
	@GetMapping("/countUpdate")
	public String countUpdate(@RequestParam(defaultValue = "0") int mBoardNo, 
			@RequestParam(defaultValue = "0") int teamNoticeNo, Model model) {
		//1
		logger.info("공지사항 조회수 업로드 파라미터 mBoardNo={},teamNoticeNo={} ",mBoardNo,teamNoticeNo);
		
		if(teamNoticeNo==0) {
			model.addAttribute("msg","잘못된 접근입니다.");
			model.addAttribute("url","/myBoard/teamNotice?mBoardNo="+mBoardNo);
			return "common/message";
		}
		
		//2
		int cnt = teamNoticeService.updateViewCount(teamNoticeNo);
		logger.info("조회수 업데이트 결과 cnt={}",cnt);
		
		//3
		//4
		return "redirect:/myBoard/teamNoticeDetail?mBoardNo="+mBoardNo+"&teamNoticeNo="+teamNoticeNo;
	}
	
	
	
	//팀별 공지사항 디테일 페이지
	@RequestMapping("/teamNoticeDetail")
	public String teamBoardDetil(@RequestParam(defaultValue = "0") int mBoardNo, 
			@RequestParam(defaultValue = "0") int teamNoticeNo, Model model, HttpSession session) {
		//1
		logger.info("팀 공지사항 디테일 화면, 파라미터 mBoardNo={},teamNoticeNo={}",mBoardNo,teamNoticeNo);
		String userid=(String)session.getAttribute("userid");
		logger.info("팀 공지사항 디테일 접속 사용자 아이디 userid={}",userid);
		
		//사원의 시퀀스 번호
		int userNo = memberService.selectMemberNo(userid);

		//2
		Map<String, Object> map = teamNoticeService.selectDetail(teamNoticeNo);
		logger.info("팀 공지사항 디테일 결과 map={}",map);

		String myBoardName = myBoardListService.selectByBoardName(mBoardNo);
		logger.info("마이보드 이름 myBoardName={}",myBoardName);	
		
		//이전글 다음글
		Map<String, Integer> nextMap = new HashMap<>();
		nextMap.put("mBoardNo", mBoardNo);
		nextMap.put("teamNoticeNo", teamNoticeNo);
		Map<String, Object> resultMap = teamNoticeService.selectTeamNoticeNext(nextMap);
		logger.info("이전글/다음글 조회 결과 resultMap={}",resultMap);
		
		

		//3.
		model.addAttribute("map",map);
		model.addAttribute("myBoardName",myBoardName);
		model.addAttribute("userid",userid);
		model.addAttribute("userNo",userNo);
		model.addAttribute("resultMap",resultMap);
		
		//4
		return "myBoard/teamNoticeDetail";
	}
	
	
	//파일 다운로드
	@RequestMapping("/downloadFile")
	//ModelAndView => 데이터와 뷰를 동시에 설정 가능
	public ModelAndView downloadFile(@RequestParam(defaultValue = "0") int teamNoticeNo,
			@RequestParam String fileName,HttpServletRequest request) {
		
		//1
		logger.info("공지사항 파일 다운로드 처리 파라미터 teamNoticeNo={}, fileName={}",teamNoticeNo, fileName);
		
		//강제 다운로드 처리를 위한 뷰페이지로 보내준다

		Map<String, Object> map = new HashMap<>();
		//업로드 경로
		String upPath = fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_TEAMNOTICE_FLAG);
		File file = new File(upPath, fileName);
		map.put("file", file);

		//ModelAndView(String viewName, Map<String, ?> model)
		ModelAndView mav = new ModelAndView("DownloadView", map);
		return mav;
		
		
	}
	
	//공지사항 수정 화면
	@GetMapping("/teamNoticeEdit")
	public String teamNoticeEdit_get(@ModelAttribute MyBoardListVO myBoardListVo,
			@RequestParam (defaultValue = "0") int teamNoticeNo,Model model, HttpSession session) {
		//1
		String userid = (String)session.getAttribute("userid");
		String type="edite";
		logger.info("팀 공지사항 수정 페이지 파라미터 myBoardListVo,={},userid={}",myBoardListVo,userid);
		
		//2
		myBoardListVo.setMemId(userid);
		myBoardListVo=myBoardListService.selectMyBoardInfo(myBoardListVo);
		logger.info("팀 게시판 정보 찾기 결과 myBoardListVo={}",myBoardListVo);
		
		Map<String, Object> map = teamNoticeService.selectDetail(teamNoticeNo);
		logger.info("디테일 정보 map={}",map);
		
		
		//3
		model.addAttribute("map",map);
		model.addAttribute("myBoardListVo",myBoardListVo);
		model.addAttribute("teamNoticeNo",teamNoticeNo);
		model.addAttribute("type",type);
		
		//4
		return "/myBoard/teamNoticeWrite";
	}
	
	
	//공지사항 수정
	@PostMapping("teamNoticeEdit")
	public String teamNoticeEdit_post(@ModelAttribute TeamNoticeVO teamNoticeVo,
			@RequestParam(defaultValue = "0") int mBoardNo,@RequestParam String oldFileName,
			HttpServletRequest request, Model model) {
		//1
		logger.info("공지사항 수정 처리 파라미터 teamNoticeVo={},mBoardNo={}",teamNoticeVo,mBoardNo);
		
		String fileName="", originalFileName="";
		try {
			List<Map<String, Object>> fileList
			=fileUploadUtil.fileupload(request, ConstUtil.UPLOAD_TEAMNOTICE_FLAG);

			long fileSize = 0;
			for(Map<String, Object> map : fileList) {
				fileName=(String) map.get("fileName");
				originalFileName=(String) map.get("originalFileName");
				fileSize= (long) map.get("fileSize");				
			}//for

			teamNoticeVo.setFileName(fileName);
			teamNoticeVo.setOriginname(originalFileName);
			teamNoticeVo.setFsize(fileSize);	
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	
		//2
		int cnt = teamNoticeService.updateTeamNotice(teamNoticeVo);
		logger.info("팀별 공지사항 수정 결과 cnt={}",cnt);
		
		String msg="글 수정에 실패하였습니다.";
		String url="/myBoard/teamNoticeEdit?mBoardNo="+mBoardNo+"&teamNoticeNo="+teamNoticeVo.getTeamNoticeNo();
		
		if(cnt>0) {
			msg="글 수정이 완료되었습니다.";
			url="/myBoard/teamNoticeDetail?mBoardNo="+mBoardNo+"&teamNoticeNo="+teamNoticeVo.getTeamNoticeNo();
			
			if(fileName!=null && !fileName.isEmpty()) { //
				if(oldFileName!=null && !oldFileName.isEmpty()) {//
					String upPath
					=fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_TEAMNOTICE_FLAG);
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
		//4
		return "common/message";
	}
	
	//파일 삭제
	@ResponseBody
	@RequestMapping("deleteFile")
	public int teamNoticeFileDel(@ModelAttribute TeamNoticeVO teamNoticeVo,
			@RequestParam String oldFileName,HttpServletRequest request, Model model) {
		//1
		logger.info("파일 삭제 처리 ajax 파라미터 teamNoticeVo={},oldFileName={}",teamNoticeVo,oldFileName);
		
		//2
		int cnt = teamNoticeService.deleteFile(teamNoticeVo.getTeamNoticeNo());
		logger.info("파일 삭제 처리 결과 cnt={}",cnt);
		
		if(cnt>0) {
			if(oldFileName!=null && !oldFileName.isEmpty()) { //
				String upPath=fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_TEAMNOTICE_FLAG);
				File file = new File(upPath,oldFileName);
	
				if(file.exists()) {
					boolean bool=file.delete();
					logger.info("파일 삭제 여부 : {}", bool);
				}
			}
		}
		
		return cnt;
						
	}
	
	
	//공지사항 삭제
	@RequestMapping("/teamNoticeDel")
	public String teamNoticeDel(@RequestParam (defaultValue = "0") int mBoardNo,
			@RequestParam (defaultValue = "0") int teamNoticeNo, 
			@RequestParam String oldFileName,HttpServletRequest request,  Model model) {
		//1
		logger.info("삭제처리 파라미터 mBoardNo={}",mBoardNo);

		//2
		TeamNoticeVO teamNoticeVo = teamNoticeService.selectTeamNoticeByNo(teamNoticeNo);
		
		Map<String, String> map = new HashMap<>();
		//key 이름은 xml의 key 이름과 동일해야함, 순서는 상관 없음
		map.put("teamNoticeNo", teamNoticeNo+"");
		map.put("step", teamNoticeVo.getStep()+"");
		map.put("contentno", teamNoticeVo.getContentno()+"");
		map.put("groupno", teamNoticeVo.getGroupno()+"");
		
		logger.info("삭제 처리 파라미터, map={}",map);
		int cnt = teamNoticeService.deleteTeamNotice(map);
		logger.info("삭제 처리 결과 cnt={}",cnt);
		

		String msg="삭제가 완료되었습니다.";
		String url="/myBoard/teamNotice?mBoardNo="+mBoardNo;


		if(oldFileName!=null && !oldFileName.isEmpty()) { //
			String upPath=fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_TEAMNOTICE_FLAG);
			File file = new File(upPath,oldFileName);

			if(file.exists()) {
				boolean bool=file.delete();
				logger.info("파일 삭제 여부 : {}", bool);
			}
		}
			
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		//4
		return "common/message";
	}
	
	
	//댓글 조회
	@ResponseBody
	@RequestMapping("/reply_select")
	public Map<String, Object> reply_select(@ModelAttribute MyBoardSearchVo searchVo) {
		
		//1
		logger.info("댓글 검색 파라미터 groupno()={}",searchVo);
		
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
		//전체 댓글 검색
		List<Map<String, Object>> replyList = teamNoticeService.selectReply(searchVo);
		logger.info("댓글 검색 결과 replyList.size()={}",replyList.size());
		logger.info("댓글 검색 결과 replyList={}",replyList);
		
		//전체 댓글 카운트
		int totalCount = teamNoticeService.selectReplyTotalCount(searchVo.getContentno());
		logger.info("totalCount={}",totalCount);
		pagingInfo.setTotalRecord(totalCount);
		
		
		Map<String,Object> resultMap = new HashMap<>();
		resultMap.put("replyList", replyList);
		resultMap.put("pagingInfo", pagingInfo);
		
		return resultMap;
	}
	
	
	//댓글 등록
	@ResponseBody
	@RequestMapping("/reply_insert")
	public int reply_insert(@ModelAttribute TeamNoticeVO teamNoticeVo,
			@RequestParam (defaultValue = "0") int mBoardNo) {
		//1
		logger.info("리플 등록 파라미터 teamNoticeVo={}",teamNoticeVo);
		
		//2
		MyBoardListVO boardListVo = new MyBoardListVO();
		boardListVo.setMemNo(teamNoticeVo.getMemNo());
		boardListVo.setMBoardNo(mBoardNo);
		logger.info("리플 등록 마이 보드 검색 파라미터 boardListVo={}",boardListVo);
		
		
		int myBoardNo = myBoardListService.seleectMyBoardNo(boardListVo);
		teamNoticeVo.setMyBoardNo(myBoardNo);
		logger.info("리플 등록 파라미터 수정 teamNoticeVo={}",teamNoticeVo);
				
		int cnt= teamNoticeService.addreply(teamNoticeVo);
		logger.info("등록 댓글 결과 cnt={}",cnt);
		
		return cnt;
	
	}
	
	
	
	//댓글 수정
	@ResponseBody
	@RequestMapping("/reply_update")
	public Map<String,Integer> reply_update(@ModelAttribute TeamNoticeVO teamNoticeVo, int curPage) {
		//1.
		logger.info("팀 공지사항 수정하기 파라미터 teamNoticeVo={},curPage",teamNoticeVo,curPage);
		
		//2.
		int cnt = teamNoticeService.updeteReply(teamNoticeVo);
		logger.info("댓글 수정 결과 cnt={}",cnt);
		
		//3.
		Map<String, Integer> result = new HashMap<>();
		result.put("cnt", cnt);
		result.put("curPage", curPage);
		
		//4.
		return result;
	}
	
	
	
	//댓글 삭제
	@ResponseBody
	@RequestMapping("/reply_delete")
	public int teamNoticeDelReply(@RequestParam (defaultValue = "0") int teamNoticeNo) {
		//1
		logger.info("댓글 삭제처리 파라미터 teamNoticeNo={}",teamNoticeNo);

		//2
		TeamNoticeVO teamNoticeVo = teamNoticeService.selectTeamNoticeByNo(teamNoticeNo);
		
		Map<String, String> map = new HashMap<>();
		//key 이름은 xml의 key 이름과 동일해야함, 순서는 상관 없음
		map.put("teamNoticeNo", teamNoticeNo+"");
		map.put("step", teamNoticeVo.getStep()+"");
		map.put("contentno", teamNoticeVo.getContentno()+"");
		map.put("groupno", teamNoticeVo.getGroupno()+"");
		
		logger.info("댓글 삭제 처리 파라미터, map={}",map);
		int cnt = teamNoticeService.deleteTeamNotice(map);
		logger.info("댓글 삭제 처리 결과 cnt={}",cnt);

		//4
		return cnt;
	}
	
	
	
	//대댓글 등록
	@ResponseBody
	@RequestMapping("reReply_insert")
	public int reReply_insert(@ModelAttribute TeamNoticeVO teamNoticeVo,
			@RequestParam (defaultValue = "0") int mBoardNo) {
		
		//1
		logger.info("리_리플 등록 파라미터 teamNoticeVo={}",teamNoticeVo);
		
		//2
		MyBoardListVO boardListVo = new MyBoardListVO();
		boardListVo.setMemNo(teamNoticeVo.getMemNo());
		boardListVo.setMBoardNo(mBoardNo);
		logger.info("리_리플 등록 마이 보드 검색 파라미터 boardListVo={}",boardListVo);
		
		
		int myBoardNo = myBoardListService.seleectMyBoardNo(boardListVo);
		teamNoticeVo.setMyBoardNo(myBoardNo);
		logger.info("리_리플 등록 파라미터 수정 teamNoticeVo={}",teamNoticeVo);
				
		int cnt= teamNoticeService.addReReply(teamNoticeVo);
		logger.info("등록 리_댓글 결과 cnt={}",cnt);
		
		return cnt;		
	}

	
}
