package com.ez.ezBears.staff.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.ezBears.common.ConstUtil;
import com.ez.ezBears.common.FileUploadUtil;
import com.ez.ezBears.dept.model.DeptService;
import com.ez.ezBears.dept.model.DeptVO;
import com.ez.ezBears.staff.model.StaffService;
import com.ez.ezBears.staff.model.StaffVO;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/staff")
@RequiredArgsConstructor
public class StaffController {
	private static final Logger logger = LoggerFactory.getLogger(StaffController.class);
	
	private final StaffService staffService;
	private final DeptService deptService;
	private final FileUploadUtil fileUploadUtil;
	
	@GetMapping("/staffWrite")
	public String write_get(Model model) {
		logger.info("스태프 등록 화면 이동");
		
		List<DeptVO> deptList = deptService.selectDeptList();
		
		model.addAttribute("deptList", deptList);
		
		return "/staff/staffWrite";
		
		//http://localhost:9091/ezBears/staff/staffWrite
	}
	
	@PostMapping("/staffWrite")
	public String write_post(@ModelAttribute StaffVO staffVo, HttpServletRequest request) {
		//1
		logger.info("스태프 등록 처리 파라미터, staffVo={}", staffVo);
		
		//2
		//파일 업로드 처리
		String fileName="", originalFileName="";
		long fileSize=0;
			try {
				List<Map<String, Object>> list
					= fileUploadUtil.fileupload(request, ConstUtil.UPLOAD_STAFFIMAGE_FLAG);
				
				for(Map<String, Object> map : list) {
					fileName=(String)map.get("fileName");
					originalFileName=(String)map.get("originalFileName");
					fileSize=(long)map.get("fileSize");
				}//for
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		
		
		//db
		int cnt = staffService.insertStaff(staffVo);
		logger.info("스태프 등록 처리 결과, cnt={}", cnt);
		
		//3
		//4
		return "redirect:/staff/staffList";
	}
	
	@GetMapping("/staffEdit")
	public String edit_get() {
		logger.info("스태프 수정 화면 이동");
		
		return "/staff/staffEdit";
		
		//http://localhost:9091/ezBears/staff/staffEdit
	}
	
	@GetMapping("/staffDelete")
	public String delete_get() {
		logger.info("스태프 삭제 화면 이동");
		
		return "/staff/staffDelete";
		
		//http://localhost:9091/ezBears/staff/staffDelete
	}
	
	@GetMapping("/staffDetail")
	public String detail_get() {
		logger.info("스태프 상세페이지로 이동");
		
		return "/staff/staffDetail";
		
		//http://localhost:9091/ezBears/staff/staffDetail
	}
	
	@GetMapping("/staffList")
	public String list_get(Model model) {
		logger.info("스태프 목록페이지로 이동");
		
		List<StaffVO> list = staffService.selectAllStaff();
		
		model.addAttribute("list", list);
		
		return "/staff/staffList";
		
		//http://localhost:9091/ezBears/staff/staffList
	}
	


}

