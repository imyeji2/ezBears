package com.ez.ezBears.record.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/record")
public class TeamRecordController {
	private static final Logger logger = LoggerFactory.getLogger(TeamRecordController.class);
	
	@RequestMapping("/team")
	public String record() {
		//1,4
		logger.info("팀 기록 보여주기");
		return "/record/team";
	}
	
	
}