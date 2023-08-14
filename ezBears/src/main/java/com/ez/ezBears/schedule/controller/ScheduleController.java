package com.ez.ezBears.schedule.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/myBoard")
@RequiredArgsConstructor

public class ScheduleController {
	private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);
	
	/* 캘린더 */
	
	   @RequestMapping("/Calender")
	   public String Calender() {
	      logger.info("캘린더 뷰");
	      return "myBoard/Calender";
	   }
	   
	   @RequestMapping("/Calender_write")
	   public String Calender_wr() {
	      logger.info("일정등록 뷰");
	      return "myBoard/Calender_write";
	   }
	   


}
