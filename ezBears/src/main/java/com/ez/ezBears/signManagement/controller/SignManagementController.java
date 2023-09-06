package com.ez.ezBears.signManagement.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.ezBears.common.ConstUtil;
import com.ez.ezBears.common.PaginationInfo;
import com.ez.ezBears.common.SearchVO;
import com.ez.ezBears.dept.model.DeptService;
import com.ez.ezBears.dept.model.DeptVO;
import com.ez.ezBears.myBoard.model.MyBoardListVO;
import com.ez.ezBears.sign.model.SignService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/signManagement")
@RequiredArgsConstructor
public class SignManagementController {
	private static final Logger logger = 
			LoggerFactory.getLogger(SignManagementController.class); 
	
	private final SignService signService;
	private final DeptService deptService;
	
	
	@RequestMapping("/completeApproval")
	public String completeApproval(@ModelAttribute SearchVO searchVo,
			@RequestParam(required = false) String searchTitle,
			@RequestParam(defaultValue = "0") int searchDeptNo,
			@RequestParam(required = false) String searchName,
			Model model) {
		logger.info("결재 완료 페이지 이동");
		
		List<DeptVO> deptList = deptService.selectDeptList();
		model.addAttribute("deptList", deptList);
		
		//-----------------------------여기부터는 페이징처리와 검색 처리를 위한 코드들--------------------------------------------
		//pagination 객체 생성해서 없는 변수들 선언해준다
		PaginationInfo pagination = new PaginationInfo();
		pagination.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagination.setCurrentPage(searchVo.getCurrentPage());
		pagination.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		//pagination 객체 이용해서 searchVo에 필요한 변수 마저 선언해주기
		searchVo.setFirstRecordIndex(pagination.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		logger.info("설정 후 searchVo={}", searchVo);
		
		int totalRecord = signService.countAllComplete(searchTitle, searchDeptNo, searchName);
		pagination.setTotalRecord(totalRecord);
		
		model.addAttribute("pagination", pagination);
		
		List<Map<String, Object>> completeList = signService.selectAllComplete(searchVo, searchTitle, searchDeptNo, searchName);
		logger.info("결재완료 completeList.size={}", completeList.size());
		
		model.addAttribute("completeList", completeList);
		
		return "/signManagement/completeApproval";
		
		//http://localhost:9091/ezBears/signManagement/completeApproval
	}
	
	@RequestMapping("/underApproval")
	public String underApproval(@ModelAttribute SearchVO searchVo,
			@RequestParam(required = false) String searchTitle,
			@RequestParam(defaultValue = "0") int searchDeptNo,
			@RequestParam(required = false) String searchName,
			Model model) {
		logger.info("결재 중 페이지 이동");
		
		List<DeptVO> deptList = deptService.selectDeptList();
		model.addAttribute("deptList", deptList);
		
		//-----------------------------여기부터는 페이징처리와 검색 처리를 위한 코드들--------------------------------------------
		//pagination 객체 생성해서 없는 변수들 선언해준다
		PaginationInfo pagination = new PaginationInfo();
		pagination.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagination.setCurrentPage(searchVo.getCurrentPage());
		pagination.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		//pagination 객체 이용해서 searchVo에 필요한 변수 마저 선언해주기
		searchVo.setFirstRecordIndex(pagination.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		logger.info("설정 후 searchVo={}", searchVo);
		
		int totalRecord = signService.countAllUnder(searchTitle, searchDeptNo, searchName);
		pagination.setTotalRecord(totalRecord);
		
		model.addAttribute("pagination", pagination);
		
		List<Map<String, Object>> underList = signService.selectAllUnder(searchVo, searchTitle, searchDeptNo, searchName);
		logger.info("결재중 list.size={}", underList.size());
		
		model.addAttribute("underList", underList);
		
		return "/signManagement/underApproval";
		
		//http://localhost:9091/ezBears/signManagement/underApproval
	}
	
	
	@RequestMapping("/approvalManagementNavTab")
	public String selectNav() {
		
		return "inc/approvalManagementNavTab";
	}
}
