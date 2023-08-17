package com.ez.ezBears.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class indexController {
	private static final Logger logger = LoggerFactory.getLogger(indexController.class);
	
	@RequestMapping("/")
	public String index(HttpSession session) {
		logger.info("index 페이지");
		String userid=(String) session.getAttribute("userid");
		
		String result="";
		if(userid==null || userid.isEmpty()) {
			logger.info("로그인페이지 이동");
			result="login/login";
		}else {
			logger.info("인덱스페이지로 이동 userid={}",userid);
			result="index";
		}
		
		
		return result;
	}
	
	
}
