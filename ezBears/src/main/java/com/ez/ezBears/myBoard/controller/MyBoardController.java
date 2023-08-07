package com.ez.ezBears.myBoard.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/myBoard")
public class MyBoardController {
	private static final Logger logger = LoggerFactory.getLogger(MyBoardController.class);
	
	@RequestMapping("/board")
	public String board() {
		//1,4
		logger.info("마이보드 보여주기");
		return "myBoard/board";
	}

	
	@RequestMapping("/teamNoticeList")
	public String teamNoticeList() {
		//1
		logger.info("팀 공지사항 리스트 페이지");
		//2
		//3
		//4
		return "myBoard/teamNoticeList";
	}
	
	
	@RequestMapping("/teamNoticeDetail")
	public String teamBoardDetil(/* @RequestParam (defaultValue = "0")int no */) {
		//1
		logger.info("팀보드 게시물 디테일 페이지 파라미터 no={}");
		//2
		//3
		//4
		return "myBoard/teamNoticeDetail";
	}
	
	@RequestMapping("/teamNoticeWrite")
	public String teamNoticeWrite() {
		logger.info("팀 공지사항 등록하기 페이지");
		return "myBoard/teamNoticeWrite";
	}
	
	@RequestMapping("/teamWorkBoardWrite")
	public String teamWorkBoardWrite() {
		logger.info("팀 업무 게시판 등록하기 페이지");
		return "myBoard/teamWorkBoardWrite";
	}
	
	@RequestMapping("/teamWorkBoardDetail")
	public String teamWorkBoardDetail() {
		logger.info("팀 업무 게시판 상세 보기");
		return "myBoard/teamWorkBoardDetail";
	}
}


