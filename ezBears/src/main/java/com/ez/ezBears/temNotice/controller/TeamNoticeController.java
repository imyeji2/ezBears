package com.ez.ezBears.temNotice.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.ezBears.myBoard.controller.MyBoardController;
import com.ez.ezBears.myBoard.model.MyBoardListService;
import com.ez.ezBears.temNotice.model.TeamNoticeService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/myBoard")
@RequiredArgsConstructor
public class TeamNoticeController {
	private static final Logger logger = LoggerFactory.getLogger(MyBoardController.class);
	private final MyBoardListService myBoardListService;
	//private final TeamNoticeService teamNoticeService;
	//예지
	/*팀별 공지사항 게시판 */
	@RequestMapping("/teamNotice")
	public String teamNotice(@RequestParam (defaultValue = "0") int myBoardNo, Model  model) {
		
		//1.
		logger.info("팀 공지사항 리스트 페이지, 파라미터 myBoardNo={}",myBoardNo);
		
		//2.

		
		//3.
		model.addAttribute("myBoardNo",myBoardNo);
		
		
		//4.
		return "myBoard/teamNoticeList";
	}
	
	
	@RequestMapping("/teamNoticeDetail")
	public String teamBoardDetil(/* @RequestParam (defaultValue = "0")int no */) {
		logger.info("팀 공지사항 디테일 페이지 파라미터 no={}");
		return "myBoard/teamNoticeDetail";
	}
	
	
	@RequestMapping("/teamNoticeWrite")
	public String teamNoticeWrite() {
		logger.info("팀 공지사항 등록하기 페이지");
		return "myBoard/teamNoticeWrite";
	}
	
}
