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
			Model  model) {
		//1
		logger.info("팀 업무 게시판 리스트 페이지 파라미터 myBoardNo={}",mBoardNo);
		
		
		//2
		
		//3
		model.addAttribute("mBoardNo",mBoardNo);
		
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
			Model model,HttpServletRequest request) {
		
		//1
		logger.info("팀별 업무 게시판 글 등록 파라미터 teamVo={}",teamVo);
		logger.info("팀별 업무 게시판 글 등록 파라미터 todolistVO={}",todolistVO);
		logger.info("팀별 업무 게시판 글 등록 파라미터 items={}",items);
		
		//2.
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

			teamVo.setFileName(fileName);
			teamVo.setOriginFileName(originalFileName);
			teamVo.setFsize(fileSize);	
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		
		
		//3
		
		//3-1
		/*
		 * int cnt = teamWorkBoardService List<ToDoListDetailVO> list =
		 * items.getItems(); logger.info("list.size={}",list.size());
		 */
		//4
		return "";
	}
	
	
	
	/*팀별 업무 게시판 상세보기*/
	@RequestMapping("/teamWorkBoardDetail")
	public String teamWorkBoardDetail() {
		logger.info("팀 업무 게시판 상세 보기");
		return "myBoard/teamWorkBoardDetail";
	}
	
}
