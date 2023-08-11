package com.ez.ezBears.staff.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.ezBears.dept.model.DeptService;
import com.ez.ezBears.dept.model.DeptVO;
import com.ez.ezBears.staff.model.StaffService;
import com.ez.ezBears.staff.model.StaffVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/staff")
@RequiredArgsConstructor
public class StaffController {
	private static final Logger logger = LoggerFactory.getLogger(StaffController.class);
	
	private final StaffService staffService;
	private final DeptService deptService;
	
	@GetMapping("/staffWrite")
	public String write_get(Model model) {
		logger.info("스태프 등록 화면 이동");
		
		List<DeptVO> deptList = deptService.selectDeptList();
		
		model.addAttribute("deptList", deptList);
		
		return "/staff/staffWrite";
		
		//http://localhost:9091/ezBears/staff/staffWrite
	}
	
	@PostMapping("/staffWrite")
	public String write_post(@ModelAttribute StaffVO staffVo) {
		//1
		logger.info("스태프 등록 처리 파라미터, staffVo={}", staffVo);
		
		//2
		
		
		//3
		
		//4
		return "";
	}
	
	@GetMapping("/staffEdit")
	public String edit_get() {
		logger.info("스태프 수정 화면 이동");
		
		return "/staff/staffEdit";
		
		//http://localhost:9091/ezBears/staff/staffEdit
	}
	
	@GetMapping("/staffDelete")
	public String delete_get() {
		logger.info("스태프 삭제 화면 이동");
		
		return "/staff/staffDelete";
		
		//http://localhost:9091/ezBears/staff/staffDelete
	}
	
	@GetMapping("/staffDetail")
	public String detail_get() {
		logger.info("스태프 상세페이지로 이동");
		
		return "/staff/staffDetail";
		
		//http://localhost:9091/ezBears/staff/staffDetail
	}
	
	@GetMapping("/staffList")
	public String list_get() {
		logger.info("스태프 목록페이지로 이동");
		
		return "/staff/staffList";
		
		//http://localhost:9091/ezBears/staff/staffList
	}
	


}

