package com.ez.ezBears.staff.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/staff")
public class StaffController {
	private static final Logger logger = LoggerFactory.getLogger(StaffController.class);
	
	
	@GetMapping("/staffWrite")
	public String write_get() {
		logger.info("스태프 등록 화면 이동");
		
		return "/staff/staffWrite";
		
		//http://localhost:9091/ezBears/staff/staffWrite
	}
	
	@GetMapping("/staffEdit")
	public String edit_get() {
		logger.info("스태프 등록 화면 이동");
		
		return "/staff/staffEdit";
		
		//http://localhost:9091/ezBears/staff/staffEdit
	}
	
	@GetMapping("/staffDelete")
	public String delete_get() {
		logger.info("스태프 등록 화면 이동");
		
		return "/staff/staffDelete";
		
		//http://localhost:9091/ezBears/staff/staffDelete
	}
	
	@GetMapping("/staffDetail")
	public String detail_get() {
		logger.info("스태프 등록 화면 이동");
		
		return "/staff/staffDetail";
		
		//http://localhost:9091/ezBears/staff/staffDetail
	}
	
	@GetMapping("/staffList")
	public String list_get() {
		logger.info("스태프 등록 화면 이동");
		
		return "/staff/staffList";
		
		//http://localhost:9091/ezBears/staff/staffList
	}
	


}

