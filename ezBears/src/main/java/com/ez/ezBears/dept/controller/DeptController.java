package com.ez.ezBears.dept.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.ezBears.member.controller.MemberController;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/dept")
@RequiredArgsConstructor
public class DeptController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@GetMapping("/write")
	public String write() {
		logger.info("부서 등록 페이지");
		return "dept/deptWrite";
	}
	
	@GetMapping("/list")
	public String list() {
		logger.info("부서 목록 페이지");
		return "dept/deptList";
	}
}
