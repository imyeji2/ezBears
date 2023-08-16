package com.ez.ezBears.member.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.ezBears.common.ConstUtil;
import com.ez.ezBears.common.FileUploadUtil;
import com.ez.ezBears.dept.model.DeptService;
import com.ez.ezBears.dept.model.DeptVO;
import com.ez.ezBears.member.model.MemberService;
import com.ez.ezBears.member.model.MemberVO;
import com.ez.ezBears.position.model.PositionService;
import com.ez.ezBears.position.model.PositionVO;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/Member")
@RequiredArgsConstructor
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	private final DeptService deptService;
	private final PositionService positionService;
	private final MemberService memberService;
	private final FileUploadUtil fileUploadUtil;
	
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
	public String write_post(@ModelAttribute MemberVO vo, HttpServletRequest request, Model model) {
		
		//1
		logger.info("회원등록 처리, 파라미터 vo={}",vo);
		
		
		//2
		
		
		String fileName = "", originalFileName = "";
		long fileSize = 0;
		
		try {
			List<Map<String, Object>> list = fileUploadUtil.fileupload(request, ConstUtil.UPLOAD_MEMIMAGE_FLAG);
			
			for(Map<String, Object> map : list) {
				fileName = (String) map.get("fileName");
				originalFileName = (String) map.get("originalFileName");
				fileSize = (long) map.get("fileSize");
			}
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		vo.setMemImage(fileName);
		
		int result = memberService.insertMem(vo);
		logger.info("멤버 등록 완료, result = {}",result);
		
		String msg = "사원 등록에 실패하였습니다.", url = "/Member/write";
		
		if(result > 0) {
			msg = "사원 등록이 완료되었습니다.";
			url = "/Member/list";
		}
		
		//3
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		//4
		return "common/message";
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
