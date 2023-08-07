package com.ez.ezBears.myBoard.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/myBoard")
public class MyBoardController {
	private static final Logger logger = LoggerFactory.getLogger(MyBoardController.class);
	
	@RequestMapping("/board")
	public String board() {
		//1
		logger.info("마이보드 보여주기");
		return "myBoard/board";
	}
	
	
	@RequestMapping("/Approval_wr")
	public String Approval_wr() {
		logger.info("결재 작성");
		return "myBoard/Approval_wr";
	}
	
	@RequestMapping("/Approval_detail")
	public String Approval_detail() {
		logger.info("결재 디테일");
		return "myBoard/Approval_detail";
	}
	
	@RequestMapping("/hard_detail")
	public String hard_detail() {
		logger.info("웹하드 디테일");
		return "myBoard/hard_detail";
	}
	@RequestMapping("/hard_delete")
	public String hard_delete() {
		logger.info("웹하드 삭제");
		return "myBoard/hard_delete";
	}
	@RequestMapping("/Approval_delete")
	public String Approval_delete() {
		logger.info("결재하드 삭제");
		return "myBoard/Approval_delete";
	}
	
	
}
