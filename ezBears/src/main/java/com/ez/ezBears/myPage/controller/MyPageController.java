package com.ez.ezBears.myPage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/mypage")
public class MyPageController {
	@RequestMapping("/edit")
	public String wirte() {
		
		return "mypage/edit";
	}
}
