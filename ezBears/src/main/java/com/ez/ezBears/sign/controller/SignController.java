package com.ez.ezBears.sign.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/myBoard")
public class SignController {
	/*
	  http://localhost:9091/ezBears/myBoard/Approval?myBoardNo=0
	 */
	
	private static final Logger logger = LoggerFactory.getLogger(SignController.class);
	
	
	  @RequestMapping("/Approval")
	   public String Approval(@RequestParam (defaultValue = "0") int mBoardNo, Model model) {
		  logger.info("결재 리스트 출력 mBoardNo={}",mBoardNo);
	      
	      model.addAttribute("mBoardNo",mBoardNo);
	      return "myBoard/Approval";
	   }
	   
	   @RequestMapping("/Approval_write")
	   public String Approval_wr() {
	      logger.info("결재 작성");
	      return "myBoard/Approval_write";
	   }
	   @RequestMapping("/Approval_edit")
	   public String Approval_edit() {
		   logger.info("결재 수정");
		   return "myBoard/Approval_edit";
	   }
	   
	   
	   @RequestMapping("/Approval_detail")
	   public String Approval_detail() {
	      logger.info("결재 디테일");
	      return "myBoard/Approval_detail";
	   }
	   
	   @RequestMapping("/Approval_delete")
	   public String Approval_delete() {
	      logger.info("결재 삭제");
	      return "myBoard/Approval_delete";
	   }
}
