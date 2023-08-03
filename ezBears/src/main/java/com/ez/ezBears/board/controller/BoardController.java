package com.ez.ezBears.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board")
public class BoardController {

	@RequestMapping("/board_write")
	public String wirte() {
		
		return "board/board_write";
	}
	
	@RequestMapping("/board_list")
	public String list() {
		
		return "board/board_list";
	}
}
