package com.ez.ezBears.attendanceManagement.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/attendanceManagement")
public class AttendanceController {
	private static final Logger logger = LoggerFactory.getLogger(AttendanceController.class);
	
	@GetMapping("/attendanceAll")
	public String attendanceAll() {
		
		return "/attendanceManagement/attendanceAll";
		
		//http://localhost:9091/ezBears/attendanceManagement/attendanceAll
	}
	
	@GetMapping("/attendanceSearch")
	public String attendanceSearch() {
		
		return "/attendanceManagement/attendanceSearch";
		
		//http://localhost:9091/ezBears/attendanceManagement/attendanceSearch
	}
	
	
}
