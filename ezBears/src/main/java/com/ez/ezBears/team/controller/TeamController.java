package com.ez.ezBears.team.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/team")
public class TeamController {
	private static final Logger logger = LoggerFactory.getLogger(TeamController.class);
	
	@GetMapping("/teamWrite")
	public String write_get() {
		logger.info("선수 등록 화면 이동");
		
		return "/team/teamWrite";
		
		//http://localhost:9091/ezBears/team/teamWrite
	}
	
	@GetMapping("/teamEdit")
	public String edit_get() {
		logger.info("선수 등록 화면 이동");
		
		return "/team/teamEdit";
		
		//http://localhost:9091/ezBears/team/teamEdit
	}
	
	@GetMapping("/teamDelete")
	public String delete_get() {
		logger.info("선수 등록 화면 이동");
		
		return "/team/teamDelete";
		
		//http://localhost:9091/ezBears/team/teamDelete
	}
	
	@GetMapping("/teamDetail")
	public String detail_get() {
		logger.info("선수 등록 화면 이동");
		
		return "/team/teamDetail";
		
		//http://localhost:9091/ezBears/team/teamDetail
	}
	
	@GetMapping("/teamList")
	public String List_get() {
		logger.info("선수 등록 화면 이동");
		
		return "/team/teamList";
		
		//http://localhost:9091/ezBears/team/teamList
	}

}
