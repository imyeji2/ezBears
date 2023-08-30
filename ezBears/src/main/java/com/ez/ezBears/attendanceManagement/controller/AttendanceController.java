package com.ez.ezBears.attendanceManagement.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.ezBears.attendance.model.AttendanceService;
import com.ez.ezBears.dept.model.DeptService;
import com.ez.ezBears.dept.model.DeptVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/attendanceManagement")
@RequiredArgsConstructor
public class AttendanceController {
	private static final Logger logger = LoggerFactory.getLogger(AttendanceController.class);
	
	private final DeptService deptService;
	private final AttendanceService attendanceService;
	/*
	@GetMapping("/attendanceAll")
	public String attendanceAll() {
		
		return "/attendanceManagement/attendanceAll";
		
		//http://localhost:9091/ezBears/attendanceManagement/attendanceAll
	}
	*/
	
	@RequestMapping("/attendanceSearch")
	public String attendanceSearch(
			Model model) throws ParseException {
		logger.info("출/퇴근 검색 화면 이동");
		
		List<DeptVO> deptList = deptService.selectDeptList();
		model.addAttribute("deptList", deptList);
		
		List<Map<String, Object>> attendanceList = attendanceService.selectAllView();
		logger.info("출/퇴근 검색 화면에 view 띄우기, attendanceList.size={}", attendanceList.size());
		
		//------------------------------이제부터 근무시간을 계산하기 위한 코드들---------------------------------------
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		
		//for문 안에서 각각 map 요소들 세팅
		for(Map<String, Object> map : attendanceList) {
			Timestamp timestamp1 = (Timestamp) map.get("IN_TIME");
			logger.info("timestamp1={}", timestamp1);
			Timestamp timestamp2 = (Timestamp) map.get("OUT_TIME");
			logger.info("timestamp2={}", timestamp2);
			
			double hourGap = 0;  // 기본적으로 시간 차이를 0으로 설정

		    if(timestamp2 != null) {  // date2가 비어있지 않은 경우에만 계산
		    	String date1 = timestamp1.toString(); // Timestamp를 String으로 변환
		    	String date2 = timestamp2.toString(); // Timestamp를 String으로 변환
		    	
		        Date format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date1);
		        Date format2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date2);

		        // 시간의 차이 구하기
		        hourGap = Math.ceil(((format2.getTime() - format1.getTime()) / 3600000d)*10)/10;
		    }
		    
		    logger.info("hourGap={}", hourGap);
		    
		    map.put("hourGap", Double.toString(hourGap));
		    logger.info("map={}", map);
		}
		
		logger.info("출/퇴근 상세보기 처리 후, attendanceList.size={}", attendanceList.size());
		
		model.addAttribute("attendanceList", attendanceList);
		
		//-----------------------------여기부터는 페이징처리와 검색 처리를 위한 코드들--------------------------------------------
		
		
		
		
		
		return "/attendanceManagement/attendanceSearch";
		
		//http://localhost:9091/ezBears/attendanceManagement/attendanceSearch
	}
	
	
}
