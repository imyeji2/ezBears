package com.ez.ezBears.team.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.ezBears.dept.model.DeptService;
import com.ez.ezBears.dept.model.DeptVO;
import com.ez.ezBears.team.model.TeamService;
import com.ez.ezBears.team.model.TeamVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/team")
@RequiredArgsConstructor
public class TeamController {
	private static final Logger logger = LoggerFactory.getLogger(TeamController.class);
	
	private final TeamService teamService;
	private final DeptService deptService;
	
	@GetMapping("/teamWrite")
	public String write_get(Model model) {
		logger.info("선수 등록 화면 이동");
		
		List<DeptVO> deptList = deptService.selectDeptList();
		
		model.addAttribute("deptList", deptList);
		
		return "/team/teamWrite";
		
		//http://localhost:9091/ezBears/team/teamWrite
	}
	
	@PostMapping("/teamWirte")
	public String write_post(@ModelAttribute TeamVO teamVo) {
		logger.info("선수 등록 처리 파라미터 teamVo={}", teamVo);
		
		int cnt = teamService.insertTeam(teamVo);
		logger.info("선수 등록 처리 결과, cnt={}", cnt);
		
		return "/team/teamList";
	}
	
	
	@GetMapping("/teamEdit")
	public String edit_get() {
		logger.info("선수 등록 화면 이동");
		
		return "/team/teamEdit";
		
		//http://localhost:9091/ezBears/team/teamEdit
	}
	
	@GetMapping("/teamDelete")
	public String delete_get() {
		logger.info("선수 등록 화면 이동");
		
		return "/team/teamDelete";
		
		//http://localhost:9091/ezBears/team/teamDelete
	}
	
	@GetMapping("/teamDetail")
	public String detail_get() {
		logger.info("선수 등록 화면 이동");
		
		return "/team/teamDetail";
		
		//http://localhost:9091/ezBears/team/teamDetail
	}
	
	@GetMapping("/teamList")
	public String List_get() {
		logger.info("선수 등록 화면 이동");
		
		return "/team/teamList";
		
		//http://localhost:9091/ezBears/team/teamList
	}

}
