package com.ez.ezBears.member.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.ezBears.common.ConstUtil;
import com.ez.ezBears.common.FileUploadUtil;
import com.ez.ezBears.common.PaginationInfo;
import com.ez.ezBears.common.SearchVO;
import com.ez.ezBears.dept.model.DeptService;
import com.ez.ezBears.dept.model.DeptVO;
import com.ez.ezBears.member.model.MemberListVO;
import com.ez.ezBears.member.model.MemberService;
import com.ez.ezBears.member.model.MemberVO;
import com.ez.ezBears.myBoard.model.MyBoardListService;
import com.ez.ezBears.myBoard.model.MyBoardListVO;
import com.ez.ezBears.myBoard.model.MyBoardService;
import com.ez.ezBears.position.model.PositionService;
import com.ez.ezBears.position.model.PositionVO;
import com.ez.ezBears.staff.model.StaffService;
import com.ez.ezBears.staff.model.StaffVO;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/Member")
@RequiredArgsConstructor
public class MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	private final DeptService deptService;
	private final PositionService positionService;
	private final MemberService memberService;
	private final MyBoardListService myBoardListService;
	private final StaffService staffService;
	
	//파일 업로드
	private final FileUploadUtil fileUploadUtil;
	
	@GetMapping("/write")
	public String write(Model model) {
		
		//1
		logger.info("회원 등록 페이지");
		
		//2 
		
		//카테고리 가지고오기
		List<DeptVO> deptList = deptService.selectDeptList();
		List<PositionVO> positionList = positionService.selectPositionList();
		
		//아이디 자동 생성
		String memberId = memberService.createMemId();
		
		
		//3
		model.addAttribute("deptList", deptList);
		model.addAttribute("positionList", positionList);
		model.addAttribute("memberId", memberId);
		
		return "Member/MemberWrite";
	}
	
	@PostMapping("/write")
	public String write_post(@ModelAttribute MemberVO vo, HttpServletRequest request, Model model) {
		
		//1
		logger.info("회원등록 처리, 파라미터 vo={}",vo);
		
		//2

		String fileName = "", originalFileName = "";
		long fileSize = 0;
		
		try {
			List<Map<String, Object>> list = fileUploadUtil.fileupload(request, ConstUtil.UPLOAD_MEMIMAGE_FLAG);
			
			for(Map<String, Object> map : list) {
				fileName = (String) map.get("fileName");
				originalFileName = (String) map.get("originalFileName");
				fileSize = (long) map.get("fileSize");
			}
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		vo.setMemImage(fileName);
		int salary = vo.getMemSal() * 10000;
		vo.setMemSal(salary);
		
		int result = memberService.insertMem(vo);
		
		String msg = "사원 등록에 실패하였습니다.", url = "/Member/write";
		if(result > 0) {
		
			//부서 번호 값으로 부서 이름 검색
			logger.info("부서 번호 값 deptNo={}", vo.getDeptNo());
			String deptName = deptService.findDeptName(vo.getDeptNo());
			
			//부서 이름으로 동적 게시판 번호 찾기
			logger.info("부서 이름 deptName={}", deptName);
			int MdeptNo = myBoardListService.findBoardNoByBoardName(deptName);
			
			//내 동적 게시판에 부서 번호로 게시판 등록
			logger.info("동적게시판 부서번호 MdeptNo={}", MdeptNo);
			
			MyBoardListVO myBoardListVo = new MyBoardListVO();
			
			myBoardListVo.setMBoardNo(MdeptNo);
			myBoardListVo.setMemNo(vo.getMemNo());
			
			logger.info("동적게시판 myBoardListVo={}", myBoardListVo);
			
			int cnt = myBoardListService.insertMyBoard(myBoardListVo);
			
			if(cnt > 0) {
				msg = "사원 등록이 완료되었습니다.";
				url = "/Member/list";
			}else {
				msg ="오류가 발생하였습니다.";
			}
		}
		
		//3
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		//4
		return "common/message";
	}

	@RequestMapping("/list")
	public String list(@ModelAttribute SearchVO searchVo, Model model) {
		
		//1
		logger.info("회원 리스트 페이지, 파라미터 searchVo={}",searchVo);
		
		//2
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		
		List<MemberVO> list = memberService.selectAllMem(searchVo);
		logger.info("멤버 조회 결과, list.size={}", list.size());
		
		int totalRecord = memberService.totalList(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		
		//3
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		//4
		
		return "Member/memberList";
	}
	
	@RequestMapping("/zipcode")
	public String zipcode() {
		logger.info("우편번호 페이지");
		return "Member/zipcode";
	}
	
	@RequestMapping("/detail")
	public String detail(@RequestParam(defaultValue = "0") int memNo, Model model) {
		//1
		logger.info("회원 상세 페이지, 파라미터 memNo={}", memNo);
		
		//2
		
		//부서 직급 가지고오기	
		List<DeptVO> deptList = deptService.selectDeptList();
		List<PositionVO> positionList = positionService.selectPositionList();
		
		
		MemberVO memberVo = memberService.memberDetail(memNo);
		logger.info("회원 상세보기 결과, memberVo={}", memberVo);
		
		//3
		model.addAttribute("memberVo", memberVo);
		model.addAttribute("deptList", deptList);
		model.addAttribute("positionList", positionList);
		
		
		//4
		return "Member/memberDetail";
	}
	
	@RequestMapping("/edit")
	public String detail_post(@ModelAttribute MemberVO memberVo, @RequestParam String oldFileName, HttpServletRequest request, String sal, Model model) {
		//1
		logger.info("회원 수정, 파라미터 memberVo ={}", memberVo);
		logger.info("oldFileName={}", oldFileName);
		
		//2
		//사진 수정
		String fileName = "", originalFileName = "";
		long fileSize = 0;
		
		try {
			List<Map<String, Object>> list = fileUploadUtil.fileupload(request, ConstUtil.UPLOAD_MEMIMAGE_FLAG);
			
			for(Map<String, Object> map : list) {
				fileName = (String) map.get("fileName");
				originalFileName = (String) map.get("originalFileName");
				fileSize = (long) map.get("fileSize");
			}
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		memberVo.setMemImage(fileName);
		
		if(memberVo.getMemImage()==null || memberVo.getMemImage().isEmpty()) {
			memberVo.setMemImage(oldFileName);
		}
		
		logger.info("fileName={}",memberVo.getMemImage());
		//연봉 int로 변환
		String strSal = sal.replace(",", "");
		strSal = strSal+"0000";
		int memSal = Integer.parseInt(strSal);
		
		memberVo.setMemSal(memSal);
		
		//퇴사일 없을때 처리
		String contractDone = memberVo.getContractDone();
		
		if(contractDone == null || contractDone.isEmpty()) {
			memberVo.setContractDone("");
		}
		
		int memNo = memberVo.getMemNo();
		int result = memberService.updateMemberFromAdmin(memberVo);
		logger.info("회원 수정 결과, result={}", result);
		
		String msg="수정에 실패하였습니다.", url="/Member/detail?memNo="+memNo;
		if(result > 0) {
			msg = "수정 되었습니다.";
			url = "/Member/detail?memNo="+memNo;
		}
		
		//3
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		//4
		return "common/message";
	}

	@RequestMapping("/delete")
	public String delete(@RequestParam int memNo, Model model) {
		
		//1
		logger.info("회원 삭제, 파라미터 memNo ={}", memNo);
		
		//2
		
		String msg="퇴사 처리에 실패하였습니다.",url ="/Member/list";
		int result = memberService.deleteMem(memNo);
		
		logger.info("회원 삭제 결과, result={}", result);
		
		if(result > 0 ) {
			msg = "퇴사 처리 되었습니다.";
	
		}

		//3
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		//4
		
		return "common/message";
	}
	
	@RequestMapping("/memberInfo")
	public String memberInfo(@ModelAttribute SearchVO searchVo, Model model){
		
		
		//1
		logger.info("회원 리스트 페이지, 파라미터 searchVo={}",searchVo);
		
		//2
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.MEMRECORD_COUNT);
		
		searchVo.setRecordCountPerPage(ConstUtil.MEMRECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<Map<String, Object>> list = memberService.selectMemStaff(searchVo);
		logger.info("멤버 조회 결과, list.size={}", list.size());
	
		//카테고리 가지고오기
		List<DeptVO> deptList = deptService.selectDeptList();
		List<PositionVO> positionList = positionService.selectPositionList();
	
		int totalRecord = memberService.allMemCnt(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		
		
		//3
		model.addAttribute("deptList", deptList);
		model.addAttribute("positionList", positionList);
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		//4
		
		return "/Member/list";
		
	}
	
	@ResponseBody
    @RequestMapping("/memberDetail")
    public MemberListVO memberInfoDetail(@RequestParam int empNo) {
    	
    	//1
    	logger.info("회원들이 보는 디테일 페이지 사원 memNo={}",empNo);
    	
    	//2
    	MemberVO memberVo = memberService.memberDetail(empNo);
    	StaffVO staffVo = staffService.selectByStaffNo(empNo);
    	
    	MemberListVO memListVo = new MemberListVO();    	
    	
    	memListVo.setMemberVo(memberVo);
    	memListVo.setStaffVo(staffVo);
    	
    	logger.info("멤버 조회 결과, memListVo={}", memListVo);
    	
    	return memListVo;
    }
	
	@ResponseBody
	@RequestMapping("/memberSearch")
	public MemberListVO AllSearchMem (HttpServletRequest request, Model model) { 
		String searchbox = request.getParameter("searchbox");
		logger.info("멤버 조회, searchbox={}", searchbox);
		
		SearchVO searchVo = new SearchVO();
		searchVo.setSearchKeyword(searchbox);
		
		logger.info("멤버 조회, searchVo={}", searchVo);
		List<Map<String, Object>> list = memberService.AllselectMem(searchVo);
		logger.info("멤버 조회, list={}", list);
		
		MemberListVO memListVo = new MemberListVO(); 
		memListVo.setMemberListVO(list);
		logger.info("멤버 조회 결과, memListVo={}", memListVo);
		
		
		model.addAttribute("list", list);
		model.addAttribute("memListVo", memListVo);
		
		return memListVo;
	}
	
	@RequestMapping("/sendMSG")
	public String sendSms(Model model) {
		logger.info("메세지 전송 페이지");
		
		List<DeptVO> deptList = deptService.selectDeptList();

		model.addAttribute("deptList", deptList);
		
		return "/sms/sendSMS";
	}

}
