package com.ez.ezBears.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/Member")
@RequiredArgsConstructor
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@GetMapping("/write")
	public String write() {
		logger.info("회원 등록 페이지");
		return "Member/MemberWrite";
	}

	@GetMapping("/list")
	public String list() {
		logger.info("회원 등록 페이지");
		return "Member/memberList";
	}
	
	@GetMapping("/detail")
	public String detail() {
		logger.info("회원 등록 페이지");
		return "Member/memberDetail";
	}
}
