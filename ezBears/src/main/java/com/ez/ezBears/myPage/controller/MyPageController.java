package com.ez.ezBears.myPage.controller;

import java.math.BigDecimal;
import java.time.LocalTime;
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
	
	@RequestMapping("/attendanceIn")
	public String attendanceIn(HttpSession session, HttpServletRequest request, @RequestParam String date,
			Model model) {
		logger.info("session 확인 , session={}", session);
		BigDecimal bigDecimalMemNo = (BigDecimal) session.getAttribute("memNo");
		
		// BigDecimal 값을 int로 변환
		int memNo = bigDecimalMemNo.intValue();
		logger.info("최근 출퇴근 조회, 파라미터 memNo={}", memNo);
		
		//해당 memNo 의 가장 최근 출근 데이터 뽑기
		AttendanceVO attendanceVo = attendanceService.selectRecentAttendance(memNo);
		logger.info("attendanceVo={}", attendanceVo);
		
		//지각, 출근 처리 하기 위한 세팅
		LocalTime currentTime = LocalTime.now();
		LocalTime nineAM = LocalTime.of(9, 0); // 9시
		
		String msg = "", url = "/mypage/attendanceCheck?memNo="+memNo;
		//attandaceVo 가 null 일 경우 (즉, 첫출근일 경우 처리)
		if(attendanceVo == null) {
			int cnt = attendanceService.insertAttendance(memNo);
			logger.info("첫출근 처리 결과, cnt={}", cnt);
			
			//최근 출근날짜의 attendanceNo 가져오기
			int attendanceNo = attendanceService.selectAttendanceNo(memNo);
			logger.info("최근 출근날짜의 attendanceNo={}", attendanceNo);

			if (currentTime.isAfter(nineAM)) {
		    // 현재 시간이 9시 이후인 경우 (지각)
				int cnt2 = attendanceService.comeCompanyLate(attendanceNo); 
				logger.info("지각 처리 결과, cnt2={}", cnt2);
				
				msg = "지각 처리 되었습니다.";
			} else {
		    // 현재 시간이 9시 이전인 경우
				int cnt2 = attendanceService.comeCompanyGood(attendanceNo);
				logger.info("출근 처리 결과, cnt2={}", cnt2);
				
				msg = "첫 출근 축하드립니다.";
			}
		
		//attandaceVo 가 null이 아닐 경우 (즉, 첫출근이 아닐 경우 처리)
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
				//최근 출근날짜의 attendanceNo 가져오기
				int attendanceNo = attendanceService.selectAttendanceNo(memNo);
				
				if (currentTime.isAfter(nineAM)) {
			    // 현재 시간이 9시 이후인 경우 (지각)
					int cnt2 = attendanceService.comeCompanyLate(attendanceNo); 
					logger.info("지각 처리 결과, cnt2={}", cnt2);
					
					msg = "지각 처리 되었습니다.";
				} else {
			    // 현재 시간이 9시 이전인 경우
					int cnt2 = attendanceService.comeCompanyGood(attendanceNo);
					logger.info("출근 처리 결과, cnt2={}", cnt2);
					
					msg = "출근 처리 되었습니다.";
				}
				
			//최근의 출근날짜가 오늘 날짜일 경우
			}else {
				// 이미 출근 처리 되었다고 표시
				msg= "이미 출근처리가 되었습니다.";
				
				}
			}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "/common/message";
	}
	
	@RequestMapping("/attendanceOut")
	public String attendanceOut(HttpSession session, HttpServletRequest request, @RequestParam String date,
			Model model) {
		logger.info("session 확인 , session={}", session);
		BigDecimal bigDecimalMemNo = (BigDecimal) session.getAttribute("memNo");
		
		// BigDecimal 값을 int로 변환
		int memNo = bigDecimalMemNo.intValue();
		logger.info("최근 출퇴근 조회, 파라미터 memNo={}", memNo);
		
		//해당 memNo 의 가장 최근 출근 데이터 뽑기
		AttendanceVO attendanceVo = attendanceService.selectRecentAttendance(memNo);
		logger.info("attendanceVo={}", attendanceVo);
		
		String msg = "", url = "/mypage/attendanceCheck?memNo="+memNo;
		//attandaceVo.outTime이 null 일 경우 (퇴근 처리)
		if(attendanceVo.getOutTime() == null || attendanceVo.getOutTime().isEmpty() ) {
			//조퇴, 퇴근 처리 하기 위한 세팅
			LocalTime currentTime = LocalTime.now();
			LocalTime sixPM = LocalTime.of(18, 0); // 18시
			
			//최근 출근날짜의 attendanceNo 가져오기
			int attendanceNo = attendanceService.selectAttendanceNo(memNo);
			logger.info("최근 출근날짜의 attendanceNo={}", attendanceNo);
			
			if (currentTime.isBefore(sixPM)) {
			//현재 시간이 18시 이전인 경우 조퇴
				
				//출근 기록 뒤에 퇴근기록을 덧붙이기 위해
				String status = attendanceVo.getStatus();
				
				//출근기록, 퇴근기록으로 저장
				status = status + ", 조퇴";
				attendanceVo.setStatus(status);
				
				int cnt = attendanceService.goHome(attendanceVo);
				logger.info("조퇴 처리 결과, cnt={}", cnt);
				
				msg = "조퇴 처리 되었습니다.";
				
			}else {
			//현재 시간이 18시 이후인 경우 정상퇴근
				
				//출근 기록 뒤에 퇴근기록을 덧붙이기 위해
				String status = attendanceVo.getStatus();
				//출근기록, 퇴근기록으로 저장
				status = status + ", 퇴근";
				attendanceVo.setStatus(status);
				
				int cnt = attendanceService.goHome(attendanceVo);
				logger.info("퇴근 처리 결과, cnt={}", cnt);
				
				msg = "퇴근 처리 되었습니다.";
			}
			
		//attandaceVo.outTime이 null 이 아닐 경우(출근처리를 먼저 해야하거나 이미 퇴근처리가 된 경우)
		}else {
			//출근시간 불러오기
			String inTime = attendanceVo.getInTime();
			logger.info("intime={}",inTime);
			
			//가장 최근의 출근날짜와 오늘의 날짜를 비교하기 위한 세팅
			String subInTime = inTime.substring(0, 10);
			logger.info("subInTime={}", subInTime);
			logger.info("date= {}", date);
			
			//최근의 출근날짜가 오늘 날짜가 아닐 경우(출근을 먼저 해야함)
			if(!subInTime.equals(date)) {
				msg = "출근처리를 먼저 해주세요.";
			//최근의 출근날짜가 오늘 날짜일 경우(이미 퇴근처리된것)
			}else {
				msg= "이미 퇴근처리가 되었습니다.";
			}
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "/common/message";
	}
	
	@GetMapping("/attendanceList")
	public String attendanceList() {
		
		
		return "/mypage/attendanceList";
		
		//http://localhost:9091/ezBears/mypage/attendanceList
	}
	
	
	
}
