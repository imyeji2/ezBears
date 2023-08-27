package com.ez.ezBears.myPage.controller;

import java.math.BigDecimal;import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.ezBears.attendance.model.AttendanceService;
import com.ez.ezBears.attendance.model.AttendanceVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/mypage")
public class MyPageController {
	private static final Logger logger =
			LoggerFactory.getLogger(MyPageController.class);
	
	private final AttendanceService attendanceService;
	
	@RequestMapping("/edit")
	public String wirte() {
		
		return "mypage/edit";
	}
	
	@GetMapping("/attendanceCheck")
	public String attendanceCheck(@RequestParam(defaultValue = "0") int memNo, Model model) {
		logger.info("개인근태조회 페이지 이동, 파라미터 memNo={}", memNo);
		
		List<AttendanceVO> list = attendanceService.selectByMemNo(memNo);
		logger.info("개인근태조회 페이지 처리 결과, list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return "/mypage/attendanceCheck";
		
		//http://localhost:9091/ezBears/mypage/attendanceCheck
	}
	
	@RequestMapping("/attendanceInOut")
	public String attendanceInOut(HttpSession session, HttpServletRequest request, @RequestParam String date,
			Model model) {
		logger.info("session 확인 , session={}", session);
		BigDecimal bigDecimalMemNo = (BigDecimal) session.getAttribute("memNo");
		
		// BigDecimal 값을 int로 변환
		int memNo = bigDecimalMemNo.intValue();
		logger.info("최근 출퇴근 조회, 파라미터 memNo={}", memNo);
		
		//해당 memNo 의 가장 최근 출근 데이터 뽑기
		AttendanceVO attendanceVo = attendanceService.selectRecentAttendance(memNo);
		logger.info("attendanceVo={}", attendanceVo);
		
		//attandaceVo 가 null 일 경우 (즉, 첫출근일 경우 처리)
		if(attendanceVo == null) {
			int cnt = attendanceService.insertAttendance(memNo);
			logger.info("첫출근 처리 결과, cnt={}", cnt);
		}else {
			//출근시간 불러오기
			String inTime = attendanceVo.getInTime();
			logger.info("intime={}",inTime);
			
			//가장 최근의 출근날짜와 오늘의 날짜를 비교하기 위한 세팅
			String subInTime = inTime.substring(0, 10);
			logger.info("subInTime={}", subInTime);
			logger.info("date= {}", date);
			
			//최근의 출근날짜가 오늘 날짜가 아닐 경우(출근 처리)
			if(!subInTime.equals(date)) {
				int cnt = attendanceService.insertAttendance(memNo);
				logger.info("출근 처리 결과, cnt={}", cnt);
			//최근의 출근날짜가 오늘 날짜일 경우
			}else {
				//1) 퇴근날짜가 없는 경우(퇴근 처리)
				if(attendanceVo.getOutTime() == null || attendanceVo.getOutTime().isEmpty() ) {
					int attendanceNo = attendanceService.selectAttendanceNo(memNo);
					logger.info("attendanceNo={}",attendanceNo);
					
					int cnt = attendanceService.goHome(attendanceNo);
					logger.info("퇴근 처리 결과, cnt={}", cnt);
					
				//2) 퇴근 날짜가 있는 경우(이미 출근처리 되었다고 표시)
				}else {
					String msg= "이미 퇴근처리가 되었습니다.";
					String url = "/mypage/attendanceCheck?memNo="+memNo;
					
					model.addAttribute("msg", msg);
					model.addAttribute("url", url);
					
					return "/common/message";
				}
			}
		}
		return "redirect:/mypage/attendanceCheck?memNo="+memNo;
	}
	
	
	
	
	
}
