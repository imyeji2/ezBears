package com.ez.ezBears.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {

	@RequestMapping("/write")
	public String wirte() {
		
		return "board/write";
	}
	
	@RequestMapping("/list")
	public String list() {
		
		return "board/list";
	}
}
