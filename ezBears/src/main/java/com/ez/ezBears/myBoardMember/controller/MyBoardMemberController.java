package com.ez.ezBears.myBoardMember.controller;

import java.util.List;
import java.util.Map;

import org.apache.poi.ss.formula.ptg.MemAreaPtg;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.ezBears.MBoard.model.MBoardService;
import com.ez.ezBears.MBoard.model.MBoardVO;
import com.ez.ezBears.member.model.MemberService;
import com.ez.ezBears.myBoard.controller.MyBoardController;
import com.ez.ezBears.myBoard.model.MyBoardListService;
import com.ez.ezBears.myBoard.model.MyBoardService;
import com.ez.ezBears.myBoard.model.MyBoardVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/myBoard")
@RequiredArgsConstructor
public class MyBoardMemberController {
	private static final Logger logger = LoggerFactory.getLogger(MyBoardController.class);
	private final MyBoardListService myBoardListService;
	private final MyBoardService myBoardService;
	private final MBoardService mBoardService;
	private final MemberService memberService;

	
	@RequestMapping("/myBoardMember")
	public String myBoardMember(@RequestParam(defaultValue = "0") int mBoardNo,
			Model model, HttpSession session) {
		
		//1
		logger.info("마이보드 멤버 파라미터 mBoardNo={}",mBoardNo);
		String userid =(String)session.getAttribute("userid");
		
		int memNo = memberService.selectMemberNo(userid);
		logger.info("사원번호 memNo={}",memNo);
		
		//2
		List<Map<String, Object>> myBoardMemberList= myBoardListService.selectMyBoardMember(mBoardNo);
		logger.info("myBoardMemberList={}",myBoardMemberList.size());
		
		MBoardVO vo = mBoardService.selectMboardAdminNo(mBoardNo);
	
		int adminNo=0;
		if(vo.getMemNo()!=0) {
			adminNo=vo.getMemNo();
		}
		
		logger.info("관리자번호 adminNo={}",adminNo);
		
		//3
		model.addAttribute("memNo",memNo);
		model.addAttribute("adminNo",adminNo);
		model.addAttribute("mBoardNo",mBoardNo);
		model.addAttribute("myBoardMemberList",myBoardMemberList);
		
		
		return "/myBoard/myBoardMember";
	}
	
	@RequestMapping("/delMyBoardMember")
	public String delMyBoardMember(@RequestParam (defaultValue = "0") int mBoardNo,
			@RequestParam(defaultValue = "0") int memNo,Model model) {
		
		//1
		logger.info("마이보드 멤버 삭제 파라미터 mBoardNo={},memNo={}",mBoardNo,memNo);
		MyBoardVO vo = new MyBoardVO();
		vo.setMemNo(memNo);
		vo.setMBoardNo(mBoardNo);
		
		//2
		int cnt = myBoardService.deleteMyBoardMember(vo);
		logger.info("마이보드 삭제 결과 cnt={}",cnt);
		
		String msg="삭제 실패", url="/myBoard/myBoardMember?mBoardNo="+mBoardNo;
		
		if(cnt>0) {
			msg="정삭적으로 삭제 되었습니다";
		}
		
		//3
		model.addAttribute("msg");
		model.addAttribute("url");
		
		//4
		return "/common/message";
	}
}
