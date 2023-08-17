package com.ez.ezBears.record.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/record")
public class RecordController {
	private static final Logger logger = LoggerFactory.getLogger(RecordController.class);
	
	@RequestMapping("/playerList")
	public String playerList() {
		//1,4
		logger.info("선수 리스트 보여주기");
		return "/record/playerList";
	}
	
	@RequestMapping("/playerDetail")
	public String playerDetail() {
		//1,4
		logger.info("선수 상세 기록 보여주기");
		return "/record/playerDetail";
	}
	
	@RequestMapping("/gameRecord")
	public String gameRecord() {
		//1,4
		logger.info("경기 기록 보여주기");
		return "/record/gameRecord";
	}
	
	@RequestMapping("/gameRecordDetail")
	public String gameRecordDetail() {
		//1,4
		logger.info("경기 상세 기록 보여주기");
		return "/record/gameRecordDetail";
	}
	
	
	@RequestMapping("/gameRecordCal")
	public String gameRecordCal() {
		//1,4
		logger.info("경기 상세 기록 보여주기");
		return "/record/gameRecordCal";
	}
	
	
	@RequestMapping("/team")
	public String team() {
		//1,4
		logger.info("팀 기록 보여주기");
		return "/record/team";
	}
	
	@RequestMapping("/gameRecordDetail2")
	public String gameRecordDetail2() {
		//1,4
		logger.info("날짜 별 경기 기록 상세 보여주기");
		return "/record/gameRecordDetail2";
	}
	
	
	@RequestMapping("/summary")
	public String summary() {
		//1,4
		logger.info("경기 개요");
		return "/record/summary";
	}
	
	@RequestMapping("/lineup")
	public String lineup() {
		//1,4
		logger.info("라인업");
		return "/record/lineup";
	}
	
<<<<<<< HEAD
	@RequestMapping("/calander2")
	public String calander2() {
		//1,4
		logger.info("캘린더");
		return "/record/gameRecordCal";
	}
	
=======
	@RequestMapping("/firstInning")
	public String firstInning() {
		//1,4
		logger.info("라인업");
		return "/record/firstInning";
	}
>>>>>>> branch 'main' of https://github.com/GunwooRoh/FinalProject.git
	
}