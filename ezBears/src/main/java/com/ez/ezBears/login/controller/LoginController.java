package com.ez.ezBears.login.controller;

import java.math.BigDecimal;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.ezBears.attendance.model.AttendanceService;
import com.ez.ezBears.attendance.model.AttendanceVO;
import com.ez.ezBears.member.model.MemberService;
import com.ez.ezBears.member.model.MemberVO;
import com.ez.ezBears.staff.model.StaffService;
import com.ez.ezBears.staff.model.StaffVO;

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
	private final AttendanceService attendanceService;


	/*
	 * @GetMapping("/login") public String login() { logger.info("로그인 화면");
	 * 
	 * return "login/login"; }
	 */
	
	@PostMapping("/login")
	public String login_post(@RequestParam String userid, @RequestParam String pwd,
			@RequestParam String dept,
			@RequestParam(required = false) String chkSave, 
			HttpServletRequest request, HttpServletResponse response, 
			Model model) {

		logger.info("로그인 파라마터 userid={},pwd={},chkSave={}",userid,pwd,chkSave);

		String msg="로그인 처리 실패", url="/login/login";
		
		if(dept.equals("front")) {
			int result=memberService.loginCheck(userid, pwd);
			String type="사원";
			Map<String, Object> map = memberService.selectMemberView(userid);
			logger.info("로그인 체크 결과 result={}",result);
			if(result==memberService.LOGIN_OK) {
				if(result>0) {
					msg= map.get("MEM_NAME") + "님 로그인되었습니다.";
					url="/";

					//session
					HttpSession session=request.getSession();
					session.setAttribute("userid", userid);
					session.setAttribute("type", type);
					session.setAttribute("name", map.get("MEM_NAME"));
					session.setAttribute("position", map.get("POSITION_NAME"));
					session.setAttribute("dept_name", map.get("DEPT_NAME"));
					session.setAttribute("dept_no", map.get("DEPT_NO"));
					session.setAttribute("memNo", map.get("MEM_NO"));
					session.setAttribute("myimg", map.get("MEM_IMAGE"));
					session.setAttribute("memberType", map.get("TYPE"));
					
					
					
					logger.info("세션 로그 확인 type={},name={},position={},dept_name={},dept_no={},memNo={},myimg={},type={}",type,session.getAttribute("name"),
							type,session.getAttribute("position"),type,session.getAttribute("dept_name"),type,session.getAttribute("dept_no"),
							type,session.getAttribute("memNo"),type,session.getAttribute("myimg"),type,session.getAttribute("type"));
					session.setAttribute("memVo", map);
					logger.info("myimg 로그 확인 myimg={}",session.getAttribute("myimg"));
					
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
				}
			}else if(result==memberService.PWD_DISAGREE) {
				msg="프론트 비밀번호가 일치하지 않습니다.";
			}else if(result==memberService.USERID_NONE) {
				msg="해당 프론트 아이디가 존재하지 않습니다.";			
			}
		}else if(dept.equals("staff")) {
			int result1=staffService.loginCheck(userid, pwd);
			String type="스태프";
			Map<String, Object> map = staffService.selectStaffView(userid);
			/* StaffVO vo = staffService.getStaffById(userid); */
			logger.info("로그인 체크 결과 result1={}",result1);
			if(result1==staffService.LOGIN_OK) {
				
				if(result1>0) {
					msg= map.get("STAFF_NAME") + "님 로그인되었습니다.";
					url="/";

					//session
					HttpSession session=request.getSession();
					session.setAttribute("userid", userid);
					session.setAttribute("type", type);
					session.setAttribute("name", map.get("STAFF_NAME"));
					session.setAttribute("position", map.get("STAFF_POSITION"));
					session.setAttribute("dept_name", map.get("DEPT_NAME"));
					session.setAttribute("dept_no", map.get("DEPT_NO"));
					session.setAttribute("myimg", map.get("STAFF_IMAGE"));
					session.setAttribute("staff_no", map.get("STAFF_NO"));
					
					logger.info("세션 로그 확인 type={},name={},position={},dept_name={},dept_no={},myimg={},staff_no={}",type,session.getAttribute("name"),
							type,session.getAttribute("position"),type,session.getAttribute("dept_name"),type,session.getAttribute("dept_no"),
							type,session.getAttribute("myimg"),type,session.getAttribute("staff_no"));
					
					
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
				}
			}else if(result1==staffService.PWD_DISAGREE) {
				msg="플레이어 비밀번호가 일치하지 않습니다.";
			}else if(result1==staffService.USERID_NONE) {
				msg="해당 플레이어 아이디가 존재하지 않습니다.";			
			}else if(result1==staffService.USERID_DONE) {
				msg="해당 플레이어는 상태가 정지되었습니다";
			}
		}

		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		//4
		return "common/message";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		logger.info("로그아웃");
		String userid=(String) session.getAttribute("userid");
		
		session.removeAttribute("userid");
		logger.info("로그아웃 세션 userid={}",userid);
		
		return "redirect:/";
	}
	
}