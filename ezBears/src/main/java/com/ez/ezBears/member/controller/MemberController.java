package com.ez.ezBears.member.controller;

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
import com.ez.ezBears.member.model.MemberService;
import com.ez.ezBears.member.model.MemberVO;
import com.ez.ezBears.position.model.PositionService;
import com.ez.ezBears.position.model.PositionVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/Member")
@RequiredArgsConstructor
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	private final DeptService deptService;
	private final PositionService positionService;
	private final MemberService memberService;
	
	
	@GetMapping("/write")
	public String write(Model model) {
		
		//1
		logger.info("회원 등록 페이지");
		
		//2 
		
		//카테고리 가지고오기
		List<DeptVO> deptList = deptService.selectDeptList();
		List<PositionVO> positionList = positionService.selectPositionList();
		
		//아이디 자동 생성
		String memberId = memberService.createMemId();
		
		
		//3
		model.addAttribute("deptList", deptList);
		model.addAttribute("positionList", positionList);
		model.addAttribute("memberId", memberId);
		
		return "Member/MemberWrite";
	}
	
	@PostMapping("/write")
	public String write_post(@ModelAttribute MemberVO vo, Model model) {
		
		//1
		logger.info("회원등록 처리, 파라미터 vo={}",vo);
		
		//2
		
		//3
		
		//4
		return "";
	}

	@RequestMapping("/list")
	public String list() {
		logger.info("회원 리스트 페이지");
		return "Member/memberList";
	}
	
	@RequestMapping("/zipcode")
	public String zipcode() {
		logger.info("우편번호 페이지");
		return "Member/zipcode";
	}
	
	@GetMapping("/detail")
	public String detail() {
		logger.info("회원 상세 페이지");
		return "Member/memberDetail";
	}
}
