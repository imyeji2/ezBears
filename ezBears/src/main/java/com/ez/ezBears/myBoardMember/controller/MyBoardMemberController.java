package com.ez.ezBears.myBoardMember.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.ezBears.MBoard.model.MBoardService;
import com.ez.ezBears.MBoard.model.MBoardVO;
import com.ez.ezBears.common.ConstUtil;
import com.ez.ezBears.common.PaginationInfo;
import com.ez.ezBears.common.SearchVO;
import com.ez.ezBears.member.model.MemberService;
import com.ez.ezBears.member.model.MemberVO;
import com.ez.ezBears.myBoard.controller.MyBoardController;
import com.ez.ezBears.myBoard.model.MyBoardListService;
import com.ez.ezBears.myBoard.model.MyBoardService;
import com.ez.ezBears.myBoard.model.MyBoardVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;

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
			Model model, HttpSession session, SearchVO searchVo) {
		
		//1
		logger.info("마이보드 멤버 파라미터 mBoardNo={}",mBoardNo);
		String userid =(String)session.getAttribute("userid");
		
		int memNo = memberService.selectMemberNo(userid);
		logger.info("사원번호 memNo={}",memNo);
		
		//2
		//보드 멤버 리스트
		List<Map<String, Object>> myBoardMemberList= myBoardListService.selectMyBoardMember(mBoardNo);
		logger.info("myBoardMemberList={}",myBoardMemberList.size());
		
		//페이징 하기 위해서 보드 멤버 리스트 숫자 만큼 더해주기
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT+myBoardMemberList.size());
		
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT+myBoardMemberList.size());
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		//관리자 번호
		MBoardVO vo = mBoardService.selectMboardAdminNo(mBoardNo);
		int adminNo=0;
		if(vo.getMemNo()!=0) {
			adminNo=vo.getMemNo();
		}
		logger.info("관리자번호 adminNo={}",adminNo);
		
		//전체 멤버 불러오기
		List<Map<String, Object>> allMemberList = memberService.selectMemberList(searchVo);
		logger.info("전체 멤버 리스트 불러오기 allMemberList={}",allMemberList.size());
		
		//기존에 추가된 멤버랑 비교해서 제외
		List<Map<String, Object>> resultList = new ArrayList<>();
		int outIndex = 0;
		for(int i=0; i<allMemberList.size(); i++) {
			for(int j=0; j<myBoardMemberList.size();j++) {
				String allMemNo = allMemberList.get(i).get("MEM_NO").toString();
				String listMemNo = myBoardMemberList.get(j).get("MEM_NO").toString();
				
				if(!allMemNo.equals(listMemNo)) {
					resultList.add(allMemberList.get(i));
					System.out.println(allMemberList.get(j).get("MEM_NO"));
				}
				
			}
		}
		logger.info("resultList={}", resultList.size());
		
		int totalRecord = memberService.totalList(searchVo);
		pagingInfo.setTotalRecord(totalRecord-myBoardMemberList.size());
		logger.info("pagingInfo={}",pagingInfo.getTotalRecord());
		
		//3
		model.addAttribute("memNo",memNo);
		model.addAttribute("adminNo",adminNo);
		model.addAttribute("mBoardNo",mBoardNo);
		model.addAttribute("myBoardMemberList",myBoardMemberList);
		model.addAttribute("resultList",resultList);
		
		
		return "/myBoard/myBoardMember";
	}
	
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping("ajax_selectMyBoardMemberAll") public List<MemberVO>
	 * selectMemberAll(){
	 * 
	 * 
	 * }
	 */
	
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
