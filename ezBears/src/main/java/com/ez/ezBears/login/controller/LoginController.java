package com.ez.ezBears.login.controller;

import java.math.BigDecimal;
import java.util.List;
import java.util.HashMap;
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
import com.ez.ezBears.member.model.MemberService;
import com.ez.ezBears.member.model.MemberVO;
import com.ez.ezBears.myBoard.model.MyBoardListService;
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
	private final MyBoardListService myBoardListService;

	
//	  @GetMapping("/login") 
//	  public String login(@RequestParam StaffVO staffVo, @RequestParam MemberVO memberVo) {
//		  logger.info("로그인 화면");
//		  
//		  logger.info("memberVo 파라미터 memberVo={}",memberVo);
//		  logger.info("staffVo 파라미터 staffVo={}",staffVo);
//	  
//	  
//		  return "login/login"; 
//	  }
	 
	
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
			logger.info("로그인 체크 타입 결과 type={}",type);
			
			if(map.get("CONTRACT_DONE")==null) {
				if(result==memberService.LOGIN_OK) {
					if(result>0) {
						msg= map.get("MEM_NAME") + "님 로그인되었습니다.";
						url="/";
						
						
						List<Map<String, Object>> myBoardList = myBoardListService.selectBoardList(userid);
						
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
						session.setAttribute("myBoardList", myBoardList);
						
						
						Map<String, Object> loginuser = new HashMap<>();
						loginuser.put("userid", userid);
						loginuser.put("type", type);
						loginuser.put("name", map.get("MEM_NAME"));
						loginuser.put("position", map.get("POSITION_NAME"));
						loginuser.put("dept_name", map.get("DEPT_NAME"));
						loginuser.put("dept_no", map.get("DEPT_NO"));
						loginuser.put("memNo", map.get("MEM_NO"));
						loginuser.put("myimg", map.get("MEM_IMAGE"));
						loginuser.put("type", map.get("TYPE"));
						
						session = request.getSession();
						session.setAttribute("sessionAttributes", loginuser);
						
						logger.info("loginuser의 로그 map1={}",loginuser);
						
						
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
					url="/";
				}else if(result==memberService.USERID_NONE) {
					msg="해당 플레이어 아이디가 존재하지 않습니다.";	
					url="/";
				}
			}else if(map.get("CONTRACT_DONE")!=null) {
				msg="퇴사자 계정입니다.";
				url="/";
			}
		}else if(dept.equals("staff")) {
			int result1=staffService.loginCheck(userid, pwd);
			String type="스태프";
			Map<String, Object> map = staffService.selectStaffView(userid);
			/* StaffVO vo = staffService.getStaffById(userid); */
			
			logger.info("로그인 체크 결과 result1={}",result1);
			logger.info("로그인 체크 타입 결과 type={}",type);
			logger.info("스태프 상태 체크 타입 결과 map={}",map);
			logger.info("스태프 상태 체크 타입 결과 STAFF_STATUS={}",map.get("STAFF_STATUS"));
			
			if(map.get("STAFF_STATUS").equals("Y")) {
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
						
						Map<String, Object> loginuser2 = new HashMap<>();
						loginuser2.put("userid", userid);
						loginuser2.put("type", type);
						loginuser2.put("name", map.get("STAFF_NAME"));
						loginuser2.put("position", map.get("STAFF_POSITION"));
						loginuser2.put("dept_name", map.get("DEPT_NAME"));
						loginuser2.put("dept_no", map.get("DEPT_NO"));
						loginuser2.put("myimg", map.get("STAFF_IMAGE"));
						loginuser2.put("staff_no", map.get("STAFF_NO"));
						
						session = request.getSession();
						session.setAttribute("sessionAttributes", loginuser2);
						
						logger.info("loginuser2의 로그 map1={}",loginuser2);
						
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
					url="/";
				}else if(result1==staffService.USERID_NONE) {
					msg="해당 플레이어 아이디가 존재하지 않습니다.";
					url="/";
				}else if(result1==staffService.USERID_DONE) {
					msg="해당 플레이어는 상태가 정지되었습니다";
					url="/";
				}//LOGIN_OK if
			}else if(map.get("STAFF_STATUS").equals("N")){
				msg="계약이 만료된 스태프입니다.";
				url="/";
			}else if(map.get("STAFF_STATUS")==null) {
				msg="스태프 계정이 아닙니다.";
				url="/";
			}
		}//if(dept.equals("staff")) if

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
		session.removeAttribute("type");
		session.removeAttribute("name");
		session.removeAttribute("position");
		session.removeAttribute("dept_name");
		session.removeAttribute("dept_no");
		session.removeAttribute("memNo");
		session.removeAttribute("myimg");
		session.removeAttribute("memberType");
		session.removeAttribute("staff_no");
		session.removeAttribute("sessionAttributes");
		session.removeAttribute("memberType");
		
		logger.info("세션 로그아웃");
		
		return "redirect:/";
	}
	
}