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
}
