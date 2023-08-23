package com.ez.ezBears.team.controller;

import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;

import com.ez.ezBears.common.ConstUtil;
import com.ez.ezBears.common.FileUploadUtil;
import com.ez.ezBears.common.PaginationInfo;
import com.ez.ezBears.common.SearchVO;
import com.ez.ezBears.dept.model.DeptService;
import com.ez.ezBears.dept.model.DeptVO;
import com.ez.ezBears.team.model.TeamService;
import com.ez.ezBears.team.model.TeamVO;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/team")
@RequiredArgsConstructor
public class TeamController {
	private static final Logger logger = LoggerFactory.getLogger(TeamController.class);
	
	private final TeamService teamService;
	private final DeptService deptService;
	private final FileUploadUtil fileUploadUtil;
	
	@GetMapping("/teamWrite")
	public String write_get(Model model) {
		logger.info("선수 등록 화면 이동");
		
		List<DeptVO> deptList = deptService.selectDeptList();
		
		model.addAttribute("deptList", deptList);
		
		return "/team/teamWrite";
		
		//http://localhost:9091/ezBears/team/teamWrite
	}
	
	@PostMapping("/teamWrite")
	public String write_post(@ModelAttribute TeamVO teamVo, HttpServletRequest request,
			Model model) {
		logger.info("선수 등록 처리 파라미터 teamVo={}", teamVo);
		
		//이미지 파일 업로드
		String fileName="", originalFileName="";
		long fileSize=0;
		
		try {
			List<Map<String, Object>> list = 
					fileUploadUtil.fileupload(request, ConstUtil.UPLOAD_TEAMIMAGE_FLAG);
			
			for(Map<String, Object> map : list) {
				fileName = (String)map.get("fileName");
				originalFileName = (String)map.get("originalFileName");
				fileSize = (long)map.get("fileSize");
			}//for
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		teamVo.setPlayerImage(fileName);
		
		//db
		int cnt = teamService.insertTeam(teamVo);
		logger.info("선수 등록 처리 결과, cnt={}", cnt);
		
		return "redirect:/team/teamList";
	}
	
	@GetMapping("/teamEdit")
	public String edit_get(@RequestParam(defaultValue = "0") int playerNo, Model model) {
		logger.info("선수 수정 화면 이동, 파라미터 playerNo={}", playerNo);
		
		Map<String, Object> map = teamService.selectByPlayerNo(playerNo);
		model.addAttribute("map", map);
		
		List<DeptVO> deptList = deptService.selectDeptList();
		model.addAttribute("deptList", deptList);
		logger.info("선수 수정 화면 이동 처리 결과, map={}", map);
		
		return "/team/teamEdit";
		
		//http://localhost:9091/ezBears/team/teamEdit
	}
	
	@PostMapping("/teamEdit")
	public String edit_post(@ModelAttribute TeamVO teamVo, HttpServletRequest request,
			@RequestParam String oldFileName) {
		logger.info("선수 수정 처리, 파라미터 teamVo={}", teamVo);
		logger.info("oldFileName={}", oldFileName);
		
		//파일 업로드 처리
		String fileName="", originalFileName="";
		long fileSize=0;
		
		try {
			List<Map<String, Object>> list = 
					fileUploadUtil.fileupload(request, ConstUtil.UPLOAD_TEAMIMAGE_FLAG);
			
			for(Map<String, Object> map : list) {
				fileName = (String)map.get("fileName");
				originalFileName = (String)map.get("originalFileName");
				fileSize = (long)map.get("fileSize");
			}//for
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		teamVo.setPlayerImage(fileName);
		
		if(teamVo.getPlayerImage()==null || teamVo.getPlayerImage().isEmpty()) {
			teamVo.setPlayerImage(oldFileName);
		}
		
		//db
		int cnt = teamService.updateTeam(teamVo);
		logger.info("선수 수정 처리 결과, cnt={}", cnt);
		
		return "redirect:/team/teamDetail?playerNo="+teamVo.getPlayerNo();
	}
	
	@GetMapping("/teamDelete")
	public String delete_get() {
		logger.info("선수 삭제 화면 이동");
		
		return "/team/teamDelete";
		
		//http://localhost:9091/ezBears/team/teamDelete
	}
	
	@GetMapping("/teamDetail")
	public String detail_get(@RequestParam(defaultValue = "0") int playerNo, Model model) {
		logger.info("선수 상세보기 화면 이동, 파라미터 playerNo = {}", playerNo);
		
		Map<String, Object> detailMap = teamService.selectByPlayerNo(playerNo);
		logger.info("선수 상세보기 처리 결과, detailMap={}", detailMap);
		
		model.addAttribute("map", detailMap);
		
		return "/team/teamDetail";
		
		//http://localhost:9091/ezBears/team/teamDetail
	}
	
	@RequestMapping("/teamList")
	public String List_get(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("선수 목록 화면 이동, 파라미터 searchVo={}", searchVo);
		
		//pagination 객체 생성하고 변수 없는 애들 선언해주기
		PaginationInfo pagination = new PaginationInfo();
		pagination.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagination.setCurrentPage(searchVo.getCurrentPage());
		pagination.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		//searchVo 에 비어있는 변수 선언하기
		searchVo.setFirstRecordIndex(pagination.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(pagination.getRecordCountPerPage());
		logger.info("설정 후 searchVo={}", searchVo);
		
		int totalRecord = teamService.getTotalRecord(searchVo);
		pagination.setTotalRecord(totalRecord);
		logger.info("pagination 설정 완");
		
		List<Map<String, Object>> list = teamService.selectAllTeam(searchVo);
		logger.info("선수 목록 화면 처리 결과, list.size()={}", list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("pagination", pagination);
		
		return "/team/teamList";
		
		//http://localhost:9091/ezBears/team/teamList
	}

}
