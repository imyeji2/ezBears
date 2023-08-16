package com.ez.ezBears.schedule.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.ezBears.myBoard.model.MyBoardListService;
import com.ez.ezBears.schedule.model.ScheduleService;
import com.ez.ezBears.schedule.model.ScheduleVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/myBoard")
@RequiredArgsConstructor

public class ScheduleController {
	private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);
	private final MyBoardListService myBoardListService;
	private final ScheduleService scheduleService;
	
	/* 캘린더 */
	
	   @RequestMapping("/Calender")
	   public String Calender(@RequestParam(defaultValue = "0") int myBoardNo, Model model) {
		  
		  //                                                  
	      logger.info("캘린더 뷰 myBoardNo={}",myBoardNo);
	      //
	      List<ScheduleVO> list = scheduleService.scheduleAll(myBoardNo);
	      
	      //
	      model.addAttribute("list",list);
	      //
	      return "myBoard/Calender";
	      
	   }
	   
	   @RequestMapping("/Calender_write")
	   public String Calender_wr() {
	      logger.info("일정등록 뷰");
	      return "myBoard/Calender_write";
	   }
	   


}
