package com.ez.ezBears.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.ezBears.member.model.MemberVO;

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
	
	@PostMapping("/write")
	public String write_post(@ModelAttribute MemberVO vo) {
		
		//1
		logger.info("회원가입 처리, 파라미터 vo={}",vo);
		//2
		
		//3
		
		//4
		return "";
	}

	@RequestMapping("/list")
	public String list() {
		logger.info("회원 리스트 페이지");
		return "Member/memberList";
	}
	
	@RequestMapping("/zipcode")
	public String zipcode() {
		logger.info("우편번호 페이지");
		return "Member/zipcode";
	}
	
	@GetMapping("/detail")
	public String detail() {
		logger.info("회원 상세 페이지");
		return "Member/memberDetail";
	}
}
