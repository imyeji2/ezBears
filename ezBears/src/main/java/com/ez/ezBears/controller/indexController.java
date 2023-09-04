package com.ez.ezBears.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.ezBears.MBoard.model.MBoardService;
import com.ez.ezBears.common.MyBoardSearchVo;
import com.ez.ezBears.common.SearchVO;
import com.ez.ezBears.dept.model.DeptService;
import com.ez.ezBears.member.model.MemberService;
import com.ez.ezBears.myBoard.model.MyBoardListService;
import com.ez.ezBears.myBoard.model.MyBoardService;
import com.ez.ezBears.notice.model.NoticeService;
import com.ez.ezBears.temNotice.model.TeamNoticeService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class indexController {
	private static final Logger logger = LoggerFactory.getLogger(indexController.class);
	private final NoticeService noticeService;
	private final TeamNoticeService teamNoticeService;
	private final MemberService memberService;
	private final MyBoardService myBoardService;
	private final MBoardService mBoardService;
	
	@RequestMapping("/")
	public String index(HttpSession session,Model model,
			@ModelAttribute MyBoardSearchVo searchVo) {
		
		logger.info("index 페이지");
		String userid=(String) session.getAttribute("userid");
		
		String result="";
		if(userid==null || userid.isEmpty()) {
			logger.info("로그인페이지 이동");
			result="login/login";
		}else {
			
			//메인 페이지 공지사항
			searchVo.setLastRecordIndex(5);
			List<Map<String, Object>> noticeList = noticeService.selectMainNotice(searchVo);
			logger.info("메인 공지사항 리스트 noticeList.size()",noticeList);
			
			int memNo = memberService.selectMemberNo(userid);
			int mBoardNo = myBoardService.selectMainMboardNo(memNo);
			String mBoardName = mBoardService.selectMboardName(mBoardNo);
			
			
			searchVo.setMBoardNo(mBoardNo);
			
			List<Map<String, Object>> myNoticeList = teamNoticeService.selectMainTeamNoticeList(searchVo);
			
			
			model.addAttribute("noticeList",noticeList);
			model.addAttribute("myNoticeList",myNoticeList);
			model.addAttribute("mBoardName",mBoardName);
			
			logger.info("인덱스페이지로 이동 userid={}",userid);
			result="index";
		}
		
		
		return result;
	}
	

	
}