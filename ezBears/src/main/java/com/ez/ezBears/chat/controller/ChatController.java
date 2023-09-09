
package com.ez.ezBears.chat.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/chat")
@RequiredArgsConstructor
public class ChatController {
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	
	@RequestMapping("/chattingList")
	public String chattingList() {
		//1
		//2
		//3
		//4
		return "chat/chattingList";
	}

}

