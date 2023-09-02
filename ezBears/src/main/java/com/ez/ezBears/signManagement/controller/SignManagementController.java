package com.ez.ezBears.signManagement.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.ezBears.myBoard.model.MyBoardListVO;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/signManagement")
public class SignManagementController {
	private static final Logger logger = 
			LoggerFactory.getLogger(SignManagementController.class); 
	
	
	@RequestMapping("/completeApproval")
	public String completeApproval() {
		logger.info("결재 완료 페이지 이동");
		
		return "/signManagement/completeApproval";
		
		//http://localhost:9091/ezBears/signManagement/completeApproval
	}
	
	@RequestMapping("/underApproval")
	public String underApproval() {
		logger.info("결재 중 페이지 이동");
		
		
		
		
		
		return "/signManagement/underApproval";
		
		//http://localhost:9091/ezBears/signManagement/underApproval
	}
	
	@RequestMapping("/approvalManagementNavTab")
	public String selectNav() {
		
		return "inc/approvalManagementNavTab";
	}
}
