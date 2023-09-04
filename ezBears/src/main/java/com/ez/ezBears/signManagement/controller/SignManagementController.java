package com.ez.ezBears.signManagement.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.ezBears.myBoard.model.MyBoardListVO;
import com.ez.ezBears.sign.model.SignService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/signManagement")
@RequiredArgsConstructor
public class SignManagementController {
	private static final Logger logger = 
			LoggerFactory.getLogger(SignManagementController.class); 
	
	private final SignService signService;
	
	
	@RequestMapping("/completeApproval")
	public String completeApproval(Model model) {
		logger.info("결재 완료 페이지 이동");
		
		List<Map<String, Object>> completeList = signService.selectAllComplete();
		logger.info("결재완료 completeList.size={}", completeList.size());
		
		model.addAttribute("completeList", completeList);
		
		return "/signManagement/completeApproval";
		
		//http://localhost:9091/ezBears/signManagement/completeApproval
	}
	
	@RequestMapping("/underApproval")
	public String underApproval(Model model) {
		logger.info("결재 중 페이지 이동");
		
		/*
		List<Map<String, Object>> underList = signService.selectAllUnder();
		logger.info("결재중 list.size={}", underList.size());
		
		model.addAttribute("underList", underList);
		*/
		return "/signManagement/underApproval";
		
		//http://localhost:9091/ezBears/signManagement/underApproval
	}
	
	@RequestMapping("/underApprovalAjax")
	public List<Map<String, Object>> underApprovalAjax() {
		
		
		List<Map<String, Object>> underList = signService.selectAllUnder();
		logger.info("결재중 list.size={}", underList.size());
		
		return underList;
	}
	
	@RequestMapping("/approvalManagementNavTab")
	public String selectNav() {
		
		return "inc/approvalManagementNavTab";
	}
}
