package com.ez.ezBears.teamWorkBoard.controller;


import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ez.ezBears.common.ConstUtil;
import com.ez.ezBears.common.FileUploadUtil;
import com.ez.ezBears.common.MyBoardSearchVo;
import com.ez.ezBears.common.PaginationInfo;
import com.ez.ezBears.member.model.MemberService;
import com.ez.ezBears.myBoard.controller.MyBoardController;
import com.ez.ezBears.myBoard.model.MyBoardListService;
import com.ez.ezBears.myBoard.model.MyBoardListVO;
import com.ez.ezBears.teamWorkBoard.model.TeamWorkBoardService;
import com.ez.ezBears.teamWorkBoard.model.TeamWorkBoardVO;
import com.ez.ezBears.teamWorkBoard.model.ToDoListDetailDAO;
import com.ez.ezBears.teamWorkBoard.model.ToDoListDetailListVO;
import com.ez.ezBears.teamWorkBoard.model.ToDoListDetailService;
import com.ez.ezBears.teamWorkBoard.model.ToDoListDetailVO;
import com.ez.ezBears.teamWorkBoard.model.ToDoListService;
import com.ez.ezBears.teamWorkBoard.model.ToDoListVO;
import com.ez.ezBears.temNotice.model.TeamNoticeService;
import com.ez.ezBears.temNotice.model.TeamNoticeVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/myBoard")
@RequiredArgsConstructor
public class TeamWorkBoardController {
	private static final Logger logger = LoggerFactory.getLogger(MyBoardController.class);
	private final MyBoardListService myBoardListService;
	private final FileUploadUtil fileUploadUtil;	
	private final TeamWorkBoardService teamWorkBoardService;
	private final MemberService memberService;
	private final ToDoListService toDoListService;
	private final ToDoListDetailService toDoListDetailService;

	//예지
	/*팀별 업무 게시판 리스트*/
	@RequestMapping("/teamWorkBoard")
	public String teamWorkBoard(@RequestParam (defaultValue = "0") int mBoardNo, 
			MyBoardSearchVo searchVo,Model  model) {
		//1
		logger.info("팀 업무 게시판 리스트 페이지 파라미터 myBoardNo={}",mBoardNo);
		
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
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		
		//2)searchVo에 값 세팅 -> xml에 전달할 값 
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<Map<String, Object>> list = teamWorkBoardService.selectTeamWorkBoard(searchVo);
		logger.info("팀 업무사항 게시판 리스트 조회 결과 list.size={}",list.size());
		
		int totalCount = teamWorkBoardService.selectTotalCount(searchVo);
		pagingInfo.setTotalRecord(totalCount);
		logger.info("totalCount={}",totalCount);
		
		//3
		model.addAttribute("list",list);
		model.addAttribute("mBoardNo",mBoardNo);
		model.addAttribute("pagingInfo",pagingInfo);
	
		
		//4
		return "myBoard/teamWorkBoardList";
	}
	
	
	
	
	/*팀별 업무 게시판 등록 화면*/
	@RequestMapping("/teamWorkBoardWrite")
	public String teamWorkBoardWrite(@ModelAttribute MyBoardListVO myBoardListVo,
			Model model, HttpSession session) {
		//1
		logger.info("업무 게시판 등록하기 페이지 파라미터 myBoardListVo={}",myBoardListVo);
		
		String userid=(String)session.getAttribute("userid");
		
		
		//2
		myBoardListVo.setMemId(userid);
		myBoardListVo=myBoardListService.selectMyBoardInfo(myBoardListVo);
		logger.info("업무 게시판 정보 찾기 결과 myBoardListVo={}",myBoardListVo);
		
		//3
		model.addAttribute("myBoardListVo",myBoardListVo);
		
		//4
		return "myBoard/teamWorkBoardWrite";
	}
	
	
	
	//업무게시판 등록
	@PostMapping("/teamWorkBoardWrite")
	public String teamWorkBoardWrite_post(
			@ModelAttribute TeamWorkBoardVO teamVo,
			@ModelAttribute ToDoListVO todolistVO, 
			@ModelAttribute ToDoListDetailListVO items,
			Model model,HttpServletRequest request,
			@RequestParam (defaultValue = "0") int mBoardNo) {
		
		//1
		logger.info("팀별 업무 게시판 글 등록 파라미터 teamVo={}",teamVo);
		logger.info("팀별 업무 게시판 글 등록 파라미터 todolistVO={}",todolistVO);
		logger.info("팀별 업무 게시판 글 등록 파라미터 items={}",items);

		
		
		//2.
		try {
			List<Map<String, Object>> fileList
			=fileUploadUtil.fileupload(request, ConstUtil.UPLOAD_TEAMWORKBOARD_FLAG);

			String fileName="", originalFileName="";
			long fileSize = 0;
			for(Map<String, Object> map : fileList) {
				fileName=(String) map.get("fileName");
				originalFileName=(String) map.get("originalFileName");
				fileSize= (long) map.get("fileSize");				
			}//for

			teamVo.setFileName(fileName);
			teamVo.setOriginFileName(originalFileName);
			teamVo.setFsize(fileSize);	
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		int cnt = teamWorkBoardService.teamWorkBoardInsert(teamVo, todolistVO, items);
		logger.info("업무 게시판 등록 결과 cnt={},cnt");
		
		String msg="등록 실패", url = "/myBoard/teamWorkBoardWrite?mBoardNo="+mBoardNo+
				"&teamBoardNo="+teamVo.getMyBoardNo();
		if(cnt>0) {
			msg="업무 계획이 등록되었습니다.";
			url="/myBoard/teamWorkBoard?mBoardNo="+mBoardNo;
		}
		
		//3
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);

		//4
		return "common/message";
	}
	
	
	@RequestMapping("teamWorkBoardCountUpdate")
	public String CountUpdate(@RequestParam(defaultValue = "0") int mBoardNo, 
		@RequestParam(defaultValue = "0") int teamBoardNo, Model model) {
	
			//1
			logger.info("업무게시판 조회수 업로드 파라미터 mBoardNo={},teamBoardNo={} ",mBoardNo,teamBoardNo);
			
			if(teamBoardNo==0) {
				model.addAttribute("msg","잘못된 접근입니다.");
				model.addAttribute("url","/myBoard/teamWorkBoardList?mBoardNo="+mBoardNo);
				return "common/message";
			}
			
			//2
			int cnt = teamWorkBoardService.updateViewCount(teamBoardNo);
			logger.info("조회수 업데이트 결과 cnt={}",cnt);
			
			//3
			//4
			return "redirect:/myBoard/teamWorkBoardDetail?mBoardNo="+mBoardNo+"&teamBoardNo="+teamBoardNo;		
	}
	
	

	/*팀별 업무 게시판 상세보기*/
	@RequestMapping("/teamWorkBoardDetail")
	public String teamBoardDetil(@RequestParam(defaultValue = "0") int mBoardNo, 
			@RequestParam(defaultValue = "0") int teamBoardNo, Model model, HttpSession session) {
		//1
		logger.info("팀 업무 게시판 디테일 화면, 파라미터 mBoardNo={},teamBoardNo={}",mBoardNo,teamBoardNo);
		
		String userid=(String)session.getAttribute("userid");
		logger.info("팀 업무 게시판 디테일 접속 사용자 아이디 userid={}",userid);
		
		
		//사원의 시퀀스 번호
		int userNo = memberService.selectMemberNo(userid);
		logger.info(userid);

		//2
		Map<String, Object> map = teamWorkBoardService.selectDetail(teamBoardNo);
		logger.info("투두 리스트 기본 값 map={}",map);
		
		ToDoListVO toDoList = toDoListService.selectTodoList(teamBoardNo);
		logger.info("투두 리스트 toDoLis={}",toDoList);
		
		String myBoardName = myBoardListService.selectByBoardName(mBoardNo);
		logger.info("마이보드 이름 myBoardName={}",myBoardName);	
		
		List<Map<String, Object>> mem_list = myBoardListService.selectMyBoardMember(mBoardNo);
		logger.info("마이보드 멤버 정보 mem_list.size={}",mem_list.size());
		
		//이전글 다음글
		Map<String, Integer> nextMap = new HashMap<>();
		nextMap.put("mBoardNo", mBoardNo);
		nextMap.put("teamBoardNo", teamBoardNo);
		Map<String, Object> resultMap = teamWorkBoardService.selectTeamWorkBoardNext(nextMap);
		logger.info("이전글/다음글 조회 결과 resultMap={}",resultMap);
		
		//3.
		model.addAttribute("map",map);
		model.addAttribute("myBoardName",myBoardName);
		model.addAttribute("userid",userid);
		model.addAttribute("userNo",userNo);
		model.addAttribute("toDoList",toDoList);
		model.addAttribute("mem_list",mem_list);
		model.addAttribute("resultMap",resultMap);
		
		//4
		return "myBoard/teamWorkBoardDetail";
	}
	
	
	//업무게시판 파일 다운로드
	@RequestMapping("/teamWordBoardDownloadFile")
	public ModelAndView downloadFile(@RequestParam(defaultValue = "0") int teamBoardNo,
			@RequestParam String fileName,HttpServletRequest request) {
		
		//1
		logger.info("업무게시판 파일 다운로드 처리 파라미터 teamBoardNo={}, fileName={}",teamBoardNo, fileName);
		
		//강제 다운로드 처리를 위한 뷰페이지로 보내준다

		Map<String, Object> map = new HashMap<>();
		//업로드 경로
		String upPath = fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_TEAMWORKBOARD_FLAG);
		File file = new File(upPath, fileName);
		map.put("file", file);

		//ModelAndView(String viewName, Map<String, ?> model)
		ModelAndView mav = new ModelAndView("DownloadView", map);
		return mav;
		
		
	}

	//팀별 업무 게시판 삭제
	@RequestMapping("/teamWorkBoardDel")
	public String teamWorkBoardDel(@RequestParam (defaultValue = "0") int mBoardNo,
			@RequestParam (defaultValue = "0") int teamBoardNo, 
			@RequestParam String oldFileName,HttpServletRequest request,  Model model) {
		//1
		logger.info("삭제처리 파라미터 mBoardNo={}",mBoardNo);

		//2
		TeamWorkBoardVO teamWorkBoardVo = teamWorkBoardService.selectTeamWorkBoardByNo(teamBoardNo);
		logger.info("teamWorkBoardVo={}",teamWorkBoardVo);
		
		Map<String, String> map = new HashMap<>();
		//key 이름은 xml의 key 이름과 동일해야함, 순서는 상관 없음
		map.put("teamBoardNo", teamBoardNo+"");
		map.put("step", teamWorkBoardVo.getStep()+"");
		map.put("contentno", teamWorkBoardVo.getContentno()+"");
		map.put("groupNo", teamWorkBoardVo.getGroupNo()+"");
		
		logger.info("삭제 처리 파라미터, map={}",map);
		int cnt = teamWorkBoardService.deleteTeamWorkBoard(map);
		logger.info("삭제 처리 결과 cnt={}",cnt);
		

		String msg="삭제가 완료되었습니다.";
		String url="/myBoard/teamNotice?mBoardNo="+mBoardNo;


		if(oldFileName!=null && !oldFileName.isEmpty()) { //
			String upPath=fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_TEAMWORKBOARD_FLAG);
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
	@RequestMapping("/workBoard_reply_select")
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
		List<Map<String, Object>> replyList = teamWorkBoardService.selectReply(searchVo);
		logger.info("댓글 검색 결과 replyList.size()={}",replyList.size());
		logger.info("댓글 검색 결과 replyList={}",replyList);
		
		//전체 댓글 카운트
		int totalCount = teamWorkBoardService.selectReplyTotalCount(searchVo.getContentno());
		logger.info("totalCount={}",totalCount);
		pagingInfo.setTotalRecord(totalCount);
		
		
		Map<String,Object> resultMap = new HashMap<>();
		resultMap.put("replyList", replyList);
		resultMap.put("pagingInfo", pagingInfo);
		
		return resultMap;
	}
	
	
	
	
	//댓글 등록
	@ResponseBody
	@RequestMapping("/workBoard_reply_insert")
	public int reply_insert(@ModelAttribute TeamWorkBoardVO teamWorkBoardVo,
			@RequestParam (defaultValue = "0") int mBoardNo) {
		//1
		logger.info("리플 등록 파라미터 teamWorkBoardVo={}",teamWorkBoardVo);
		
		//2
		MyBoardListVO boardListVo = new MyBoardListVO();
		boardListVo.setMemNo(teamWorkBoardVo.getMemNo());
		boardListVo.setMBoardNo(mBoardNo);
		logger.info("리플 등록 마이 보드 검색 파라미터 boardListVo={}",boardListVo);
		
		
		int myBoardNo = myBoardListService.seleectMyBoardNo(boardListVo);
		teamWorkBoardVo.setMyBoardNo(myBoardNo);
		logger.info("리플 등록 파라미터 수정 teamWorkBoardVo={}",teamWorkBoardVo);
				
		int cnt= teamWorkBoardService.addreply(teamWorkBoardVo);
		logger.info("등록 댓글 결과 cnt={}",cnt);
		
		return cnt;
	
	}	
	
	
	//댓글 수정
	@ResponseBody
	@RequestMapping("/workBoard_reply_update")
	public Map<String,Integer> reply_update(@ModelAttribute TeamWorkBoardVO teamWorkBoardVo, int curPage) {
		//1.
		logger.info("팀 공지사항 수정하기 파라미터 teamWorkBoardVo={},curPage",teamWorkBoardVo,curPage);
		
		//2.
		int cnt = teamWorkBoardService.updeteReply(teamWorkBoardVo);
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
	@RequestMapping("/workBoard_reply_delete")
	public int teaeWorkBoardDelReply(@RequestParam (defaultValue = "0") int teamBoardNo) {
		//1
		logger.info("댓글 삭제처리 파라미터 teamBoardNo={}",teamBoardNo);

		//2
		TeamWorkBoardVO teamWorkBoardVo = teamWorkBoardService.selectTeamWorkBoardByNo(teamBoardNo);
		logger.info("teamWorkBoardVo={}",teamWorkBoardVo);
		
		Map<String, String> map = new HashMap<>();
		//key 이름은 xml의 key 이름과 동일해야함, 순서는 상관 없음
		map.put("teamBoardNo", teamBoardNo+"");
		map.put("step", teamWorkBoardVo.getStep()+"");
		map.put("contentno", teamWorkBoardVo.getContentno()+"");
		map.put("groupNo", teamWorkBoardVo.getGroupNo()+"");
		
		logger.info("댓글 삭제 처리 파라미터, map={}",map);
		int cnt = teamWorkBoardService.deleteTeamWorkBoard(map);
		logger.info("댓글 삭제 처리 결과 cnt={}",cnt);

		//4
		return cnt;
	}	
	
	
	//대댓글 등록
	@ResponseBody
	@RequestMapping("workBoard_reReply_insert")
	public int reReply_insert(@ModelAttribute TeamWorkBoardVO teamWorkBoardVo,
			@RequestParam (defaultValue = "0") int mBoardNo) {
		
		//1
		logger.info("리_리플 등록 파라미터 teamWorkBoardVo={}",teamWorkBoardVo);
		
		//2
		MyBoardListVO boardListVo = new MyBoardListVO();
		boardListVo.setMemNo(teamWorkBoardVo.getMemNo());
		boardListVo.setMBoardNo(mBoardNo);
		logger.info("리_리플 등록 마이 보드 검색 파라미터 boardListVo={}",boardListVo);
		
		
		int myBoardNo = myBoardListService.seleectMyBoardNo(boardListVo);
		teamWorkBoardVo.setMyBoardNo(myBoardNo);
		logger.info("리_리플 등록 파라미터 수정 teamWorkBoardVo={}",teamWorkBoardVo);
				
		int cnt= teamWorkBoardService.addReReply(teamWorkBoardVo);
		logger.info("등록 리_댓글 결과 cnt={}",cnt);
		
		return cnt;		
	}
	
	
	
	//투두리스트 목록 검색
	@ResponseBody
	@RequestMapping("/selectTodoList")
	public List<Map<String, Object>> selectToDoList(@RequestParam (defaultValue = "0") int todolistNo){
		//1
		logger.info("투두 리스트 목록 검색 파라미터 todolistNo={}",todolistNo);
		
		//2
		List<Map<String, Object>> toDoListDetailList 
							= toDoListDetailService.selectToDoListDetail(todolistNo);
		logger.info("팀 업무 게시판 디테일 결과 toDoListDetailList={}",toDoListDetailList);
		logger.info("팀 업무 게시판 디테일 결과 toDoListDetailList.size={}",toDoListDetailList.size());
		
		//4
		return toDoListDetailList;
	}
	
	@ResponseBody
	@RequestMapping("/updateTodoListDetail")
	//투두 리스트 디테일 상태 업데이트
	public int updateTodoStatus(@ModelAttribute ToDoListDetailVO todoListDetailVo){
		//1
		logger.info("투두 디테일 상태 파라미터 todoListDetailVo={}",todoListDetailVo);
	
		//2
		int cnt = toDoListDetailService.updateTodoStatus(todoListDetailVo);
		logger.info("투두 디테일 변경 결과 cnt={}",cnt);
	
		//4
		return cnt;
	}
	
	@ResponseBody
	@RequestMapping("/addTodoDetailMem")
	public int addTodoDetailMem(@ModelAttribute ToDoListDetailVO todoVo) {
		//1
		logger.info("업무 담당자 등록 파라미터 todoVo={}",todoVo);
		
		//2
		int cnt = toDoListDetailService.updateTodoMember(todoVo);
		//4
		return cnt;
	}
	
	@ResponseBody
	@RequestMapping("/toDoDetailMemDel")
	public int toDoDetailMemDel(@RequestParam(defaultValue = "0") int todoDetailNo) {
		//1
		logger.info("업무 담당자 삭제 파라미터 todoDetailNo={}",todoDetailNo);
		
		//2
		int cnt = toDoListDetailService.delTodoMember(todoDetailNo);
		logger.info("업무 담당자 삭제 결과 cnt={}",cnt);
		//4
		return cnt;
	}
	
	/*팀별 업무 게시판 수정*/
	@RequestMapping("/teamWorkBoardEdit")
	public String teamWorkBoardEdit( @ModelAttribute MyBoardListVO myBoardListVo, 
			@RequestParam(defaultValue = "0") int teamBoardNo, Model model, HttpSession session) {
		//1
		logger.info("팀 업무 게시판 수정 화면, 파라미터 myBoardListVo={},teamBoardNo={}",myBoardListVo,teamBoardNo);
		
		String userid=(String)session.getAttribute("userid");
		logger.info("팀 업무 게시판 디테일 접속 사용자 아이디 userid={}",userid);
		
		//2
		//사원의 시퀀스 번호
		int userNo = memberService.selectMemberNo(userid);
		logger.info(userid);

		
		myBoardListVo.setMemId(userid);
		myBoardListVo=myBoardListService.selectMyBoardInfo(myBoardListVo);
		logger.info("업무 게시판 정보 찾기 결과 myBoardListVo={}",myBoardListVo);
		
		//3
		model.addAttribute("myBoardListVo",myBoardListVo);
		//2
		Map<String, Object> map = teamWorkBoardService.selectDetail(teamBoardNo);
		logger.info("투두 리스트 기본 값 map={}",map);
		
		ToDoListVO toDoList = toDoListService.selectTodoList(teamBoardNo);
		logger.info("투두 리스트 toDoLis={}",toDoList);
		
		List<Map<String, Object>> toDoListDetailList 
		= toDoListDetailService.selectToDoListDetail(toDoList.getTodolistNo());
		logger.info("팀 업무 게시판 디테일 결과 toDoListDetailList.size={}",toDoListDetailList.size());


		//3.
		model.addAttribute("map",map);
		model.addAttribute("myBoardListVo",myBoardListVo);
		model.addAttribute("userid",userid);
		model.addAttribute("userNo",userNo);
		model.addAttribute("toDoList",toDoList);
		model.addAttribute("toDoListDetailList",toDoListDetailList);
		
		//4
		return "myBoard/teamWorkBoardEdit";
	}	
	
	//팀별 업무 게시판 수정
	@PostMapping("/teamWorkBoardEdit")
	public String teamWorkBoardEdit(			
			@ModelAttribute TeamWorkBoardVO teamVo,
			@ModelAttribute ToDoListVO todolistVO, 
			@ModelAttribute ToDoListDetailListVO items,
			Model model,HttpServletRequest request,
			@RequestParam (defaultValue = "0") int mBoardNo,
			@RequestParam (required = false) String oldFileName) {
		//1
		logger.info("파라미터 teamVo={}",teamVo);
		logger.info("파라미터 todolistVO={}",todolistVO);
		logger.info("파라미터 items={}",items);
		logger.info("파라미터 mBoardNo={}",mBoardNo);
		logger.info("파라미터 oldFileName={}",oldFileName);
		
		String fileName="", originalFileName="";
		try {
			List<Map<String, Object>> fileList
			=fileUploadUtil.fileupload(request, ConstUtil.UPLOAD_TEAMWORKBOARD_FLAG);

			long fileSize = 0;
			for(Map<String, Object> map : fileList) {
				fileName=(String) map.get("fileName");
				originalFileName=(String) map.get("originalFileName");
				fileSize= (long) map.get("fileSize");				
			}//for

			teamVo.setFileName(fileName);
			teamVo.setOriginFileName(originalFileName);
			teamVo.setFsize(fileSize);	
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//2
		int cnt = teamWorkBoardService.updateBoard(teamVo,todolistVO,items);
		
		String msg="수정에 실패했습니다.", url="/myBoard/teamWorkBoardEdit?mBoardNo="+mBoardNo+"&teamBoardNo="+teamVo.getTeamBoardNo();
		
		if(cnt>0) {
			msg="업무 게시글 수정이 완료되었습니다.";
			url="/myBoard/teamWorkBoardDetail?mBoardNo="+mBoardNo+"&teamBoardNo="+teamVo.getTeamBoardNo();
			
			if(fileName!=null && !fileName.isEmpty()) { //
				if(oldFileName!=null && !oldFileName.isEmpty()) {//
					String upPath
					=fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_TEAMWORKBOARD_FLAG);
					File file= new File(upPath,oldFileName);
					if(file.exists()) {
						boolean bool=file.delete();
						logger.info("글 수정- 파일삭제 여부:{}", bool);
					}
				}
			}		
		}
		
		//3
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
		
	}
	
	
	//두투 디테일 삭제
	@ResponseBody
	@RequestMapping("/deleteDotoDetail")
	public int deleteDotoDetail(@ModelAttribute ToDoListDetailListVO listVo) {
		//1
		logger.info("업무 목록 삭제 파라미터 listVo={}",listVo);
		//2.
		int cnt = toDoListDetailService.delTodoDetailService(listVo);
		logger.info("삭제 결과 cnt={}",cnt);
		//4
		return cnt;
	}
	
	
	
	//업무 게시판 삭제
	@RequestMapping("/deleteTeamWorkBoard")
	public String deleteTeamWorkBoard(@RequestParam (defaultValue = "0") int teamBoardNo, 
			@RequestParam (defaultValue = "0") int todolistNo, @RequestParam (defaultValue = "0") int mBoardNo,
			@RequestParam String oldFileName, Model model,HttpServletRequest request) {
		
		//1
		logger.info("업무 게시판 삭제 파라미터 teamBoardNo={},todolistNo={},mBoardNo={},oldFileName={}"
													,teamBoardNo,teamBoardNo,mBoardNo,oldFileName);
		
		//2
		TeamWorkBoardVO teamWorkBoardVo = teamWorkBoardService.selectTeamWorkBoardByNo(teamBoardNo);
		Map<String, String> map = new HashMap<>();
		map.put("teamBoardNo", teamBoardNo+"");
		map.put("step", teamWorkBoardVo.getStep()+"");
		map.put("contentno", teamWorkBoardVo.getContentno()+"");
		map.put("groupNo", teamWorkBoardVo.getGroupNo()+"");
		
		logger.info("삭제 map={}",map);
		
		teamWorkBoardService.deleteBoard(map, todolistNo);
		
		String msg="삭제 실패, 다시 시도해주세요";
		String url="/myBoard/teamWorkBoardDetail?mBoardNo="+mBoardNo+"&teamBoardNo="+teamBoardNo;
		
		
		msg="삭제가 완료되었습니다.";
		url="/myBoard/teamWorkBoard?mBoardNo="+mBoardNo;

		if(oldFileName!=null && !oldFileName.isEmpty()) { //
			String upPath=fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_TEAMWORKBOARD_FLAG);
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
	
	
	//파일 삭제
	@ResponseBody
	@RequestMapping("teamWorkBoardDeleteFile")
	public int teamWorkBoardFileDel(@ModelAttribute TeamWorkBoardVO teamWorkBoardVo,
			@RequestParam String oldFileName,HttpServletRequest request, Model model) {
		//1
		logger.info("파일 삭제 처리 ajax 파라미터 teamWorkBoardVo={},oldFileName={}",teamWorkBoardVo,oldFileName);
		
		//2
		int cnt = teamWorkBoardService.deleteFile(teamWorkBoardVo.getTeamBoardNo());
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
	
}
