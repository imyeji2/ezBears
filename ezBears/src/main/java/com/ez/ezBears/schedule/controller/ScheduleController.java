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

import com.ez.ezBears.myBoard.model.MyBoardInfoVO;
import com.ez.ezBears.myBoard.model.MyBoardListService;
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
	public List<Map<String, Object>> Calender(@RequestParam(defaultValue = "0") int mBoardNo, @ModelAttribute ScheduleVO scheduleVo,
			HttpSession session ,Model model) {

		//                  
		String userid = (String)session.getAttribute("userid");
		
		scheduleVo.setMemId(userid);
		scheduleVo.setMyBoardNo(mBoardNo);
		logger.info("-------------------------------------");
		logger.info("캘린더 뷰 mBoardNo={}, userid={}",mBoardNo,userid);
		

		 List<Map<String, Object>> list = scheduleService.selectAll(scheduleVo);
		 
		 logger.info("일정 조회 list.size ={}",list);
		
		 model.addAttribute("mBoardNo",mBoardNo);
		 model.addAttribute("list",list);
		//
		return list;

	}

	@GetMapping("/Calender_write")
	public String Calender_wr(@RequestParam (defaultValue = "0") int mBoardNo ,@ModelAttribute MyBoardInfoVO myBoardInfoVo, 
			HttpSession session ,Model model) {

		//
		String userid = (String)session.getAttribute("userid");   
		logger.info("---------캘린더--------");
		logger.info("일정등록 뷰");
		logger.info("userid={}",userid);
		

		myBoardInfoVo.setMemId(userid);	
		myBoardInfoVo.setMBoardNo(mBoardNo);
		logger.info("myBoardInfo 정보={}",myBoardInfoVo);
		
		myBoardInfoVo = myBoardListService.selectBoardInfo(myBoardInfoVo);
		
		model.addAttribute("myBoardInfoVo",myBoardInfoVo);
		
		logger.info("myBoardInfo={}",myBoardInfoVo);
		
		
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
	
	
	@GetMapping("/Calender_edit")
	public String Calender_ed(@RequestParam (defaultValue = "0")int id, ScheduleVO scheduleVo
			,Model model) {
		String type="edit";
		scheduleVo.setScheduleNo(id);
		
		
		model.addAttribute("type",type);
		model.addAttribute("sc",scheduleVo);
		return "/myBoard/Calender_write";
	}
	
	
	@PostMapping("/Calender_edit")
	public String Calender_po() {
		
		return "redirect:/myBoard/Calender";
	}
	

}
