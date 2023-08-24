package com.ez.ezBears.record.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.ezBears.common.SearchVO;
import com.ez.ezBears.record.game.model.GameService;
import com.ez.ezBears.record.game.model.GameVO;

import lombok.RequiredArgsConstructor;


@Controller
@RequestMapping("/record")
@RequiredArgsConstructor
public class RecordController {
	private static final Logger logger = LoggerFactory.getLogger(RecordController.class);
	
	private final GameService gameService; 
	
	@RequestMapping("/playerList")
	public String playerList() {
		//기록 검색
		logger.info("선수 리스트 보여주기");
		return "/record/playerList";
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
	

	@RequestMapping("/calander2")
	public String calander2() {
		//1,4
		logger.info("캘린더");
		return "/record/gameRecordCal";
	}
	
	@RequestMapping("/firstInning")
	public String firstInning() {
		//1,4
		logger.info("라인업");
		return "/record/firstInning";
	}
	
	@RequestMapping("/playerDetail2")
	public String playerDetail2() {
		//1,4
		logger.info("라인업");
		return "/record/playerDetail2";
	}
	
	
	@RequestMapping("/hitterRecordWrite")
	public String hitterRecordWrite() {
		//1,4
		logger.info("타자기록입력");
		return "/record/hitterRecordWrite";
	}
	
	@RequestMapping("/hitterRecordEdit")
	public String hitterRecordEdit() {
		//1,4
		logger.info("타자기록수정");
		return "/record/hitterRecordEdit";
	}
	
	@RequestMapping("/hitterRecordDelete")
	public String hitterRecordDelete() {
		//1,4
		logger.info("타자기록삭제");
		return "/record/hitterRecordDelete";
	}
	
	@RequestMapping("/hitterRecordDetail")
	public String hitterRecordDetail() {
		//1,4
		logger.info("타자기록정보");
		return "/record/hitterRecordDetail";
	}
	
	@RequestMapping("/pitcherRecordWrite")
	public String pitcherRecordWrite() {
		//1,4
		logger.info("투수기록입력");
		return "/record/pitcherRecordWrite";
	}
	
	@RequestMapping("/pitcherRecordEdit")
	public String pitcherRecordEdit() {
		//1,4
		logger.info("투수기록수정");
		return "/record/pitcherRecordEdit";
	}
	
	@RequestMapping("/pitcherRecordDelete")
	public String pitcherRecordDelete() {
		//1,4
		logger.info("투수기록삭제");
		return "/record/pitcherRecordDelete";
	}
	
	@RequestMapping("/pitcherRecordDetail")
	public String pitcherRecordDetail() {
		//1,4
		logger.info("투수기록정보");
		return "/record/pitcherRecordDetail";
	}
	
	@RequestMapping("/gameList")
	public String gameList(@ModelAttribute SearchVO searchVo, Model model) {
		//1,4
		logger.info("경기정보, 파라미터 searchVo={}", searchVo);
			
		List<GameVO> list = gameService.selectAllGame(searchVo);
		logger.info("경기 전체 조회결과, list.size={}", list.size());
		
		model.addAttribute("list", list);

		return "/record/gameList";
	}
	
	@RequestMapping("/gameWrite")
	public String gameWrite(Model model) {
		//1,4
		logger.info("경기정보입력");
		
		return "/record/gameWrite";
	}
	
	@RequestMapping("/gameEdit")
	public String gameUpdate() {
		//1,4
		logger.info("경기정보수정");
		return "/record/gameEdit";
	}
	
	@RequestMapping("/gameDelete")
	public String gameDelete() {
		//1,4
		logger.info("경기정보삭제");
		return "/record/gameDelete";
	}
	
	@RequestMapping("/inningWrite")
	public String inningWrite() {
		//1,4
		logger.info("이닝정보등록");
		return "/record/inningWrite";
	}
	
	
	@RequestMapping("/inningEdit")
	public String inningUpdate() {
		//1,4
		logger.info("이닝정보수정");
		return "/record/inningEdit";
	}

	
	@RequestMapping("/inningDelete")
	public String inningDelete() {
		//1,4
		logger.info("이닝정보삭제");
		return "/record/inningDelete";
	}
}