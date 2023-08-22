package com.ez.ezBears.dept.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.ezBears.common.ConstUtil;
import com.ez.ezBears.common.PaginationInfo;
import com.ez.ezBears.common.SearchVO;
import com.ez.ezBears.dept.model.DeptService;
import com.ez.ezBears.dept.model.DeptVO;
import com.ez.ezBears.member.controller.MemberController;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/dept")
@RequiredArgsConstructor
public class DeptController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	private final DeptService deptService;
	
	@GetMapping("/list")
	public String list(@ModelAttribute SearchVO searchVo, Model model) {
		//1
		logger.info("부서 목록 페이지");
		
		//2
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<DeptVO> list = deptService.selectDeptList();
		logger.info("부서 조회 결과, list.size={}", list.size());
		
		int totalRecord = deptService.totalList(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		
		//3
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "dept/deptList";
	}
	
	
	@RequestMapping("/edit")
	public String edit(@ModelAttribute DeptVO deptVo, Model model) {
		//
		logger.info("부서 수정 파라미터 deptVo={}", deptVo);

		//2
		int result = deptService.editDept(deptVo);
		logger.info("부서 수정 결과, result={}",result);
		
		String msg = "수정에 실패하였습니다.", url ="/dept/list";
		if(result > 0) {
			
			
			msg = "수정되었습니다.";
		}
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4
		return "common/message";
	}
	
	@RequestMapping("/insert")
	public String insert() {
		//
		logger.info("부서 등록");
		
		//2
		
		//3
		
		//4
		return "dept/deptList";
	}
}
