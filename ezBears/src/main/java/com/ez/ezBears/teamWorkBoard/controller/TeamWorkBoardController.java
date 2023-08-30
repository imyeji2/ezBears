package com.ez.ezBears.teamWorkBoard.controller;


import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.ezBears.common.ConstUtil;
import com.ez.ezBears.common.FileUploadUtil;
import com.ez.ezBears.common.MyBoardSearchVo;
import com.ez.ezBears.common.PaginationInfo;
import com.ez.ezBears.myBoard.controller.MyBoardController;
import com.ez.ezBears.myBoard.model.MyBoardListService;
import com.ez.ezBears.myBoard.model.MyBoardListVO;
import com.ez.ezBears.teamWorkBoard.model.TeamWorkBoardService;
import com.ez.ezBears.teamWorkBoard.model.TeamWorkBoardVO;
import com.ez.ezBears.teamWorkBoard.model.ToDoListDetailListVO;
import com.ez.ezBears.teamWorkBoard.model.ToDoListDetailVO;
import com.ez.ezBears.teamWorkBoard.model.ToDoListVO;

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
		String type="write";
		
		
		//2
		myBoardListVo.setMemId(userid);
		myBoardListVo=myBoardListService.selectMyBoardInfo(myBoardListVo);
		logger.info("업무 게시판 정보 찾기 결과 myBoardListVo={}",myBoardListVo);
		
		//3
		model.addAttribute("myBoardListVo",myBoardListVo);
		model.addAttribute("type",type);
		
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
		
		String msg="등록 실패", url = "/myBoard/teamWorkBoardList?mBoardNo="+mBoardNo;
		if(cnt>0) {
			msg="업무 계획이 등록되었습니다.";
			url="/myBoard/teamWorkBoardDetail?mBoardNo="+mBoardNo+
					"&teamNoticeNo="+teamVo.getMyBoardNo();
		}
		
		//3
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);

		//4
		return "common/message";
	}
	
	
	
	/*팀별 업무 게시판 상세보기*/
	@RequestMapping("/teamWorkBoardDetail")
	public String teamWorkBoardDetail() {
		logger.info("팀 업무 게시판 상세 보기");
		return "myBoard/teamWorkBoardDetail";
	}
	
}