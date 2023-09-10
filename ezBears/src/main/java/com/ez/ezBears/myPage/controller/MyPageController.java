package com.ez.ezBears.myPage.controller;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.Date;
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

import com.ez.ezBears.attendance.model.AttendanceService;
import com.ez.ezBears.attendance.model.AttendanceVO;
import com.ez.ezBears.member.model.MemberService;
import com.ez.ezBears.member.model.MemberVO;
import com.ez.ezBears.staff.model.StaffService;
import com.ez.ezBears.staff.model.StaffVO;

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
	private final MemberService memberService;
	private final StaffService staffService;

	@RequestMapping("/edit")
	public String wirte() {

		return "mypage/edit";
	}

	@GetMapping("/attendanceCheck")
	public String attendanceCheck(HttpSession session, Model model) {
		logger.info("session 확인 , session={}", session);
		BigDecimal bigDecimalMemNo = (BigDecimal) session.getAttribute("memNo");

		// BigDecimal 값을 int로 변환
		int memNo = bigDecimalMemNo.intValue();
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
				logger.info("가장 최근 출근 번호, attendanceNo={}", attendanceNo);

				if (currentTime.isBefore(nineAM)) {
					// 현재 시간이 9시 이전인 경우
					int cnt2 = attendanceService.comeCompanyGood(attendanceNo);
					logger.info("출근 처리 결과, cnt2={}", cnt2);
					
					msg = "출근 처리 되었습니다.";
				} else {
					// 현재 시간이 9시 이후인 경우 (지각)
					int cnt2 = attendanceService.comeCompanyLate(attendanceNo); 
					logger.info("지각 처리 결과, cnt2={}", cnt2);
					
					msg = "지각 처리 되었습니다.";
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

	@RequestMapping("/attendanceList")
	public String attendanceList(HttpSession session, @RequestParam(required = false) String date, Model model) throws ParseException {
		BigDecimal bigDecimalMemNo = (BigDecimal) session.getAttribute("memNo");

		// BigDecimal 값을 int로 변환
		int memNo = bigDecimalMemNo.intValue();
		logger.info("근태 상세보기 조회, 파라미터 memNo={}", memNo);

		//날짜 검색창에 디폴트로넘기기 위한 date 세팅
		if(date == null || date.isEmpty()) {
			Date date1 = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");

			date = (String)sdf.format(date1);
		}
		logger.info("date={}", date);

		//vo에 근무시간 컬럼이 없으므로 대신 map 사용
		List<Map<String, Object>> attendanceList = attendanceService.selectAllThisMonth(memNo, date);

		double totalTime = 0;

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
			totalTime += hourGap;

			logger.info("hourGap={}", hourGap);

			map.put("hourGap", Double.toString(hourGap));
			logger.info("map={}", map);
		}

		totalTime = Math.ceil((totalTime)*10)/10;
		logger.info("총 근무시간={}", totalTime);
		logger.info("attendanceList={}", attendanceList);
		logger.info("list.size={}", attendanceList.size());

		model.addAttribute("attendanceList", attendanceList);
		model.addAttribute("date", date);
		model.addAttribute("totalTime", totalTime);
		//------------------------------------------------------ 여기까지가 list 띄우는 곳

		//지각 횟수 조회
		int cntL = attendanceService.countComeLate(memNo, date);
		logger.info("지각 횟수, cntL={}", cntL);

		//조퇴 횟수 조회
		int cntE = attendanceService.countGoEarly(memNo, date);
		logger.info("조퇴 횟수, cntE={}", cntE);

		//출근 횟수 조회
		int cntG = attendanceService.countComeGood(memNo, date);
		logger.info("출근 횟수, cntG={}", cntG);

		model.addAttribute("cntL", cntL);
		model.addAttribute("cntE", cntE);
		model.addAttribute("cntG", cntG);

		return "/mypage/attendanceList";

		//http://localhost:9091/ezBears/mypage/attendanceList
	}


	//마이페이지 비밀번호체크
	@GetMapping("/pwdchk")
	public String pwdchk(HttpSession session, Model model) {
//
//		String userid = (String) session.getAttribute("userid");
//		logger.info("마이페이지 비밀번호 체크 페이지, 파라미터 userid={}", userid);
//
//		MemberVO memberVo = memberService.selectByUserid(userid);
//		logger.info("마이페이지 비밀번호 체크 페이지, 정보 조회결과 memberVo={}", memberVo);
//		
//		model.addAttribute("memberVo", memberVo);

		return "mypage/pwdchk";
	}

	@PostMapping("/pwdchk")
	public String pwdchk_post(@ModelAttribute MemberVO memberVo,
			@ModelAttribute StaffVO staffVo,
			@RequestParam String type,
			HttpSession session, Model model) {

		String userid = (String) session.getAttribute("userid");
		logger.info("마이페이지 비밀번호 체크 페이지, 파라미터 userid={}", userid);
		String type1 = (String) session.getAttribute("type");
		logger.info("type 로그 type={}",type1);
		
		
		int result=0;
		int result1=0;
		if(type1.equals("사원")) {
			memberVo.setMemId(userid);
			logger.info("마이페이지 비밀번호 체크 처리, 파라미터 memberVo={}", memberVo);
			
			result = memberService.loginCheck(memberVo.getMemId(), memberVo.getMemPwd());
			logger.info("마이페이지 비밀번호 체크 결과, result={}", result);
		}else if(type1.equals("스태프")) {
			staffVo.setStaffId(userid);
			logger.info("마이페이지 비밀번호 체크 처리, 파라미터 staffVo={}", staffVo);
			
			result1 = staffService.loginCheck(staffVo.getStaffId(), staffVo.getStaffPwd());
			logger.info("마이페이지 비밀번호 체크 결과, result1={}", result1);
		}
		



		String url = "";
		if (result == MemberService.LOGIN_OK || result1==staffService.LOGIN_OK) {
				url = "/mypage/mypage";
		} else if (result == MemberService.PWD_DISAGREE || result1==staffService.PWD_DISAGREE) {
			String msg = "비밀번호가 일치하지 않습니다.";
			url="/mypage/pwdchk";
			model.addAttribute("msg", msg);
		}

		// 3
		model.addAttribute("url", url);

		// 4
		return "common/message";
	}

	//마이페이지 수정
	@GetMapping("/mypage")
	public String mypage_edit(HttpSession session, Model model) {

		String userid = (String) session.getAttribute("userid");
		logger.info("회원 수정 페이지, 파라미터 userid={}", userid);
		String type = (String) session.getAttribute("type");
		logger.info("회원 수정 페이지, 파라미터 type={}", type);
		
		if(type.equals("사원")) {
			MemberVO memberVo = memberService.selectByUserid(userid);
			logger.info("회원정보수정 페이지, 정보 조회결과 memberVo={}", memberVo);
			model.addAttribute("memberVo", memberVo);
		}else if(type.equals("스태프")) {
			StaffVO staffVo = staffService.selectByUserid(userid);
			logger.info("회원정보수정 페이지, 정보 조회결과 staffVo={}", staffVo);
			model.addAttribute("staffVo", staffVo);
		}


		return "mypage/edit";
	}
	
	@PostMapping("/mypage")
	public String mypage_edit_post(@ModelAttribute MemberVO memberVo,  
			@ModelAttribute StaffVO staffVo,
			HttpSession session, Model model) {

		String userid = (String) session.getAttribute("userid");
		logger.info("회원 수정 페이지, 파라미터 userid={}", userid);
		String type = (String) session.getAttribute("type");
		logger.info("회원 수정 페이지, 파라미터 type={}", type);
		
		int cnt=0;
		
		if(type.equals("사원")) {
			memberVo.setMemId(userid);
			logger.info("회원 수정 처리, 파라미터 memberVo={}", memberVo);
			
			// 전화번호 처리
			if (memberVo.getMemTel() == null || memberVo.getMemTel().isEmpty()) {
				memberVo.setMemTel("");
			}
			
			cnt = memberService.updateMypage(memberVo);
		}else if(type.equals("스태프")) {
			staffVo.setStaffId(userid);
			logger.info("회원 수정 처리, 파라미터 staffVo={}", staffVo);
			
			// 전화번호 처리
			if (staffVo.getStaffTel() == null || staffVo.getStaffTel().isEmpty()) {
				staffVo.setStaffTel("");
			}
			cnt = staffService.updateMypage(staffVo);
		}


		String msg = "회원 수정 실패!", url = "/";
		logger.info("회원정보 수정 결과, cnt={}", cnt);
		if (cnt > 0) {
			msg = "회원 수정 성공!";
		}
		// 3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		// 4
		return "common/message";
	}




	///비밀번호
	@GetMapping("/pwdchk2")
	public String pwdchk2(HttpSession session, Model model) {
//		
//		String userid = (String) session.getAttribute("userid");
//		logger.info("회원 수정 페이지, 파라미터 userid={}", userid);
//
//		MemberVO memberVo = memberService.selectByUserid(userid);
//		logger.info("마이페이지 비밀번호 체크 페이지, 정보 조회결과 memberVo={}", memberVo);
//
//		model.addAttribute("memberVo", memberVo);

		return "mypage/pwdchk2";
	}

	//비밀번호체크
	@PostMapping("/pwdchk2")
	public String pwdchk2_post(@ModelAttribute MemberVO memberVo, 
			@ModelAttribute StaffVO staffVo,
			@RequestParam String type,
			HttpSession session, Model model) {

		String userid = (String) session.getAttribute("userid");
		logger.info("마이페이지 비밀번호 체크 페이지, 파라미터 userid={}", userid);
		String type1 = (String) session.getAttribute("type");
		logger.info("type 로그 type={}",type1);
		
		int result=0;
		int result1=0;
		
		if(type1.equals("사원")) {
			memberVo.setMemId(userid);
			logger.info("비밀번호체크 처리, 파라미터 memberVo={}", memberVo);
			
			result = memberService.loginCheck(memberVo.getMemId(), memberVo.getMemPwd());
			logger.info("비밀번호체크 결과, result={}", result);
		}else if(type1.equals("스태프")) {
			staffVo.setStaffId(userid);
			logger.info("비밀번호체크 처리, 파라미터 staffVo={}", staffVo);
			
			result1 = staffService.loginCheck(staffVo.getStaffId(), staffVo.getStaffPwd());
			logger.info("비밀번호체크 결과, result1={}", result1);
		}


		

		String url = "";
		if (result == MemberService.LOGIN_OK || result1==staffService.LOGIN_OK) {
			url = "/mypage/pwd";
		} else if (result == MemberService.PWD_DISAGREE || result1==staffService.PWD_DISAGREE) {
			String msg = "비밀번호가 일치하지 않습니다.";
			url="/mypage/pwdchk2";
			model.addAttribute("msg", msg);
		}

		// 3
		model.addAttribute("url", url);
		logger.info("url주소 url={}",url);
		// 4
		return "common/message";
	}

	@GetMapping("/pwd")
	public String changepwd(HttpSession session, Model model) {
		
		String userid = (String) session.getAttribute("userid");
		logger.info("비밀번호수정 페이지, 파라미터 userid={}", userid);
		
		String type = (String) session.getAttribute("type");
		logger.info("type 로그 type={}",type);
		
		if(type.equals("사원")) {
			MemberVO memberVo = memberService.selectByUserid(userid);
			logger.info("비밀번호수정 페이지, 정보 조회결과 memberVo={}", memberVo);
			
			model.addAttribute("memberVo", memberVo);
		}else if(type.equals("스태프")) {
			StaffVO staffVo = staffService.selectByUserid(userid);
			logger.info("비밀번호수정 페이지, 정보 조회결과 staffVo={}", staffVo);
			
			
			model.addAttribute("staffVo", staffVo);
		}

		return "mypage/editpwd";
	}

	//비밀번호 수정
	@PostMapping("/pwd")
	public String changepwd_post(@ModelAttribute MemberVO memberVo,  
			@ModelAttribute StaffVO staffVo,
			HttpSession session, Model model) {
		
		String userid = (String) session.getAttribute("userid");
		logger.info("비밀번호수정 페이지, 파라미터 userid={}", userid);
		
		String type = (String) session.getAttribute("type");
		logger.info("type 로그 type={}",type);
		
		String msg = "비밀번호 수정 실패!", url = "/";
		
		if(type.equals("사원")) {
			memberVo.setMemId(userid);
			logger.info("비밀번호수정 처리, 파라미터 memberVo={}", memberVo);
			
			MemberVO existingMember = memberService.selectByUserid(userid);
			//현재 비밀번호와 새로운 비밀번호를 비교
		    if (existingMember != null && existingMember.getMemPwd().equals(memberVo.getMemPwd())) {
		        msg = "현재 비밀번호와 새로운 비밀번호가 동일합니다.";
		        url = "/mypage/pwd";
		    } else {
		        //비밀번호를 업데이트
		        int cnt = memberService.updatePwd(memberVo);
		        logger.info("비밀번호 수정 결과, cnt={}", cnt);
		        if (cnt > 0) {
		            msg = "비밀번호 수정 성공!";
		        }
		    }
			
		}else if(type.equals("스태프")) {
			staffVo.setStaffId(userid);
			logger.info("비밀번호수정 처리, 파라미터 staffVo={}", staffVo);
			
			StaffVO existingMember = staffService.selectByUserid(userid);
			//현재 비밀번호와 새로운 비밀번호를 비교
		    if (existingMember != null && existingMember.getStaffPwd().equals(staffVo.getStaffPwd())) {
		        msg = "현재 비밀번호와 새로운 비밀번호가 동일합니다.";
		        url = "/mypage/pwd";
		    } else {
		        //비밀번호를 업데이트
		        int cnt = staffService.updatePwd(staffVo);
		        logger.info("비밀번호 수정 결과, cnt={}", cnt);
		        if (cnt > 0) {
		            msg = "비밀번호 수정 성공!";
		        }
		    }
		}

		
		
	    
		// 3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		// 4
		return "common/message";
	}


}
