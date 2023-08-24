package com.ez.ezBears.myPage.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.ezBears.attendance.model.AttendanceService;
import com.ez.ezBears.attendance.model.AttendanceVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/mypage")
public class MyPageController {
	private static final Logger logger =
			LoggerFactory.getLogger(MyPageController.class);
	
	private final AttendanceService attendanceService;
	
	
	@RequestMapping("/edit")
	public String wirte() {
		
		return "mypage/edit";
	}
	
	@GetMapping("/attendanceCheck")
	public String attendanceCheck(@RequestParam(defaultValue = "0") int memNo, Model model) {
		logger.info("개인근태조회 페이지 이동, 파라미터 memNo={}", memNo);
		
		List<AttendanceVO> list = attendanceService.selectByMemNo(memNo);
		logger.info("개인근태조회 페이지 처리 결과, list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		
		
		return "/mypage/attendanceCheck";
		
		//http://localhost:9091/ezBears/mypage/attendanceCheck
	}
}
