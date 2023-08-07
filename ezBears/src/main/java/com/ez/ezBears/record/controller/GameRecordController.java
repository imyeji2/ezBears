package com.ez.ezBears.record.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/record")
public class GameRecordController {
	private static final Logger logger = LoggerFactory.getLogger(TeamRecordController.class);
	
	@RequestMapping("/gameRecord")
	public String record() {
		//1,4
		logger.info("경기 기록 보여주기");
		return "/record/gameRecord";
	}
	
}