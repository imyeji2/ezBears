package com.ez.ezBears.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/login")
public class LoginController {

	@RequestMapping("/login")
	public String login() {
		return "login/login";
	}
}
