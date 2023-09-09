
package com.ez.ezBears.chat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.ezBears.common.ConstUtil;
import com.ez.ezBears.common.MemberSearchVO;
import com.ez.ezBears.common.MyBoardSearchVo;
import com.ez.ezBears.common.PaginationInfo;
import com.ez.ezBears.member.model.MemberService;
import com.ez.ezBears.member.model.MemberVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/chat")
@RequiredArgsConstructor
public class ChatController {
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	private final MemberService memberService;
	
	
	@RequestMapping("/chattingList")
	public String chattingList(HttpSession session, Model model) {
		//1
		logger.info("채팅 페이지");
		String userid = (String) session.getAttribute("userid");
		int memNo = memberService.selectMemberNo(userid);
		logger.info("memNo={}",memNo);
		
		//2
		//3
		model.addAttribute("memNo",memNo);
		//4
		return "chat/chattingList";
	}
	
	
	@ResponseBody
	@RequestMapping("/ajax_selecAddChatMember")
	public Map<String,Object> selecAddChatMember(@ModelAttribute MemberSearchVO searchVo){
		
	 	logger.info("ajax 멤버 불러오기 MemberSearchVO={}",searchVo);
		
		//페이징 하기 위해서 보드 멤버 리스트 숫자 만큼 더해주기
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT_SIX);
		
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT_SIX);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex()); 
		
		//전체 멤버 불러오기(본인 제외)
		List<Map<String, Object>> allMemberList = memberService.selectMemberList3(searchVo);
		logger.info("전체 멤버 리스트 불러오기 allMemberList={}",allMemberList.size());

		int totalRecord = memberService.selectMemberListTotal3(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		logger.info("pagingInfo={}",pagingInfo.getTotalRecord());
		
		Map<String,Object> resultMap = new HashMap<>();
		resultMap.put("allMemberList", allMemberList);
		resultMap.put("pagingInfo", pagingInfo);
		
		return resultMap;
	
	}

}

