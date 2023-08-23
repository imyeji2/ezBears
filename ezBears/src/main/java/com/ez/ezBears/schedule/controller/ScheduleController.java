package com.ez.ezBears.schedule.controller;


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

import com.ez.ezBears.myBoard.model.MyBoardListService;
import com.ez.ezBears.myBoard.model.MyBoardListVO;
import com.ez.ezBears.schedule.model.ScheduleService;
import com.ez.ezBears.schedule.model.ScheduleVO;

import jakarta.servlet.http.HttpSession;
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
	public String Calender(@RequestParam(defaultValue = "0") int mBoardNo, Model model) {

		//                                                  
		logger.info("캘린더 뷰 mBoardNo={}",mBoardNo);

		// List<ScheduleVO> list = scheduleService.scheduleAll(myBoardNo);


		// model.addAttribute("list",list);
		
		model.addAttribute("mBoardNo",mBoardNo);
		//
		return "myBoard/Calender";

	}
	@GetMapping("/Calender_write")
	public String Calender_wr(@RequestParam (defaultValue = "0") int mBoardNo ,@ModelAttribute MyBoardListVO myBoardListVo, HttpSession session ,Model model) {

		//
		String userid = (String)session.getAttribute("userid");   
		logger.info("---------캘린더--------");
		logger.info("일정등록 뷰");
		logger.info("userid={}",userid);
		
		/*
		 myBoardListVo.setMemId(userid); myBoardListVo.setMBoardNo(mBoardNo);
		  
		  List<Map<String, Object>> list = myBoardListService.selectBoardInfo(userid);
		 
		  model.addAttribute("list",list);
		 */
	
		return "myBoard/Calender_write";
	}

	@PostMapping("/Calender_write")
	public String Calender_post(@ModelAttribute ScheduleVO scheduleVo,
			@RequestParam (defaultValue = "0")int myBoardNo) {

		//

		logger.info("일정등록 파라미터 myBoardNo={}",myBoardNo);

		//
		int cnt = scheduleService.insertSchedule(scheduleVo);
		logger.info("일정등록 결과 cnt={}",cnt);

		//

		//
		return "redirect:/myBoard/Calender";
	}

}
