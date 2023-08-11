package com.ez.ezBears.login.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.ezBears.member.model.MemberService;
import com.ez.ezBears.staff.model.StaffService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/login")
public class LoginController {
	private static final Logger logger=LoggerFactory.getLogger(LoginController.class);

	private final MemberService memberService;
	private final StaffService staffService;


	@GetMapping("/login")
	public String login() {
		logger.info("로그인 화면");

		return "login/login";
	}

	@PostMapping("/login")
	public String login_post(@RequestParam String userid, @RequestParam String pwd,
			@RequestParam String position,
			@RequestParam(required = false) String chkSave, 
			HttpServletRequest request, HttpServletResponse response, 
			Model model) {
		
		logger.info("로그인 파라마터 userid={},pwd={},chkSave={}",userid,pwd,chkSave);
		
		String msg="로그인 처리 실패", url="/login/login";
		if(position.equals("front")) {
			int result=memberService.loginCheck(userid, pwd);
			if(result==memberService.LOGIN_OK) {
				if(result>0) {
					msg=userid + "님 로그인되었습니다.";
					url="/";

					//session
					HttpSession session=request.getSession();
					session.setAttribute("userid", userid);

					//cookie
					Cookie ck = new Cookie("ck_userid", userid);
					ck.setPath("/");
					if(chkSave!=null) { //저장하기 체크한 경우
						ck.setMaxAge(1000*24*60*60); //1000일
						response.addCookie(ck);
					}else {
						ck.setMaxAge(0); //쿠키 제거
						response.addCookie(ck);
					}
				}else if(result==memberService.PWD_DISAGREE) {
					msg="비밀번호가 일치하지 않습니다.";
				}else if(result==memberService.USERID_NONE) {
					msg="해당 아이디가 존재하지 않습니다.";			
				}
			}
		}
		
		if(position.equals("player")) {
			int result1=staffService.loginCheck(userid, pwd);
			if(result1==staffService.LOGIN_OK) {
				if(result1>0) {
					msg=userid + "님 로그인되었습니다.";
					url="/";

					//session
					HttpSession session=request.getSession();
					session.setAttribute("userid", userid);

					//cookie
					Cookie ck = new Cookie("ck_userid", userid);
					ck.setPath("/");
					if(chkSave!=null) { //저장하기 체크한 경우
						ck.setMaxAge(1000*24*60*60); //1000일
						response.addCookie(ck);
					}else {
						ck.setMaxAge(0); //쿠키 제거
						response.addCookie(ck);
					}
				}else if(result1==staffService.PWD_DISAGREE) {
					msg="비밀번호가 일치하지 않습니다.";
				}else if(result1==staffService.USERID_NONE) {
					msg="해당 아이디가 존재하지 않습니다.";			
				}
			}
		}
		

		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		//4
		return "common/message";
	}

}
