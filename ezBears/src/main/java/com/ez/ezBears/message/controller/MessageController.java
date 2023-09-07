package com.ez.ezBears.message.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.ezBears.member.model.MemberService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/message")
@RequiredArgsConstructor
public class MessageController {
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	private final MemberService memberService;
	
	
	@RequestMapping("/list")
	public String message_list() {
		logger.info("메세지 페이지");
		return "message/messageList";
	}
	
	@GetMapping("/write")
	public String write_get() {
		logger.info("메세지 보내기 화면");
		
		
		
		return "message/messageWrite";
	}
	
	@PostMapping("/write")
	public String write_post() {
		
		
		
		return "message/messageWrite";
	}
	
	
}
