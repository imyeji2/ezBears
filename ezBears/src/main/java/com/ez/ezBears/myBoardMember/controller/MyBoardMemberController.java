package com.ez.ezBears.myBoardMember.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.ezBears.myBoard.controller.MyBoardController;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/myBoard")
@RequiredArgsConstructor
public class MyBoardMemberController {
	private static final Logger logger = LoggerFactory.getLogger(MyBoardController.class);

	
	@RequestMapping("/myBoardMember")
	public String myBoardMember(@RequestParam(defaultValue = "0") int mBoardNo, Model model) {
		
		model.addAttribute("mBoardNo",mBoardNo);
		return "/myBoard/myBoardMember";
	}
}
