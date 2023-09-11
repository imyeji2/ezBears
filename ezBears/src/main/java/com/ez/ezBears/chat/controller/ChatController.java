
package com.ez.ezBears.chat.controller;

import java.util.ArrayList;
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

import com.ez.ezBears.chat.model.ChatMemberService;
import com.ez.ezBears.chat.model.ChatMemberVO;
import com.ez.ezBears.chat.model.ChatMessageService;
import com.ez.ezBears.chat.model.ChatMessageVO;
import com.ez.ezBears.chat.model.ChatRoomService;
import com.ez.ezBears.common.ConstUtil;
import com.ez.ezBears.common.MemberSearchVO;
import com.ez.ezBears.common.PaginationInfo;
import com.ez.ezBears.dept.model.DeptService;
import com.ez.ezBears.dept.model.DeptVO;
import com.ez.ezBears.member.model.MemberService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/chat")
public class ChatController {
	private static final Logger logger = LoggerFactory.getLogger(ChatController.class);
	private final MemberService memberService;
	private final DeptService deptService;	
	private final ChatRoomService chatRoomService;
	private final ChatMemberService chatMemberService;
	private final ChatMessageService chatMessageService;
	
	@RequestMapping("/chattingList")
	public String chattingList(HttpSession session, Model model) {
		//1
		logger.info("채팅 페이지");
		String userid = (String) session.getAttribute("userid");
		int memNo = memberService.selectMemberNo(userid);
		logger.info("memNo={}",memNo);
		
		//2
		
		//전체 부서 검색
		List<DeptVO> deptList=deptService.selectDeptList();
		logger.info("부서 검색 결과 deptList={}",deptList.size());
		
		//3
		model.addAttribute("memNo",memNo);
		model.addAttribute("deptList",deptList);
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
	
	
	@ResponseBody
	@RequestMapping("/ajax_addChatRoom")
	public int addChatRoom(@RequestParam(defaultValue = "0") int memNo,
			HttpSession sesstion) {
		//1
		logger.info("채팅방 추가 파라미터 memNo={}",memNo);
		
		String userid =(String)sesstion.getAttribute("userid");
		int myMemNo=memberService.selectMemberNo(userid);
		
		
		//2
		ChatMemberVO member1 = new ChatMemberVO();
		member1.setMemNo(myMemNo);
		logger.info("member1={}",member1);
		
		ChatMemberVO member2 = new ChatMemberVO();
		member2.setMemNo(memNo);
		logger.info("member1={}",member2);
		
		List<ChatMemberVO> memberList = new ArrayList<>();
		memberList.add(member1);
		memberList.add(member2);
		
		int cnt =chatRoomService.addChatRoom(memberList);
		
		//4
		return cnt;
	}
	
	
	@ResponseBody
	@RequestMapping("/ajax_selectChatRoom")
	public List<Map<String, Object>> selectChatRoom(HttpSession session){
		//1
		logger.info("내 채팅방 찾기");
		String userid = (String)session.getAttribute("userid");
		int memNo = memberService.selectMemberNo(userid);
		
		//2
		List<Map<String, Object>> chatRoomList = chatRoomService.selectMyChatRoom(memNo);
		logger.info("채팅방 리스트 찾기 결과 chatRoomList={}",chatRoomList.size());
		
		//3
		
		return chatRoomList;
	}
	
	@ResponseBody
	@RequestMapping("/ajax_sendChat")
	public int insertChatMessage(@ModelAttribute ChatMemberVO memberVo,
			@RequestParam String chatMessage){
		//1
		logger.info("메시지 전송 파라미터 memberVo={},chatMessage={}",memberVo,chatMessage);
		
		//2
		int chatMemberNo = chatMemberService.selectChatMemberNo(memberVo);
		logger.info("채팅방에서 내 번호 찾기 chatMemberNo={}",chatMemberNo);
		
		ChatMessageVO messageVo = new ChatMessageVO();
		messageVo.setChatMessage(chatMessage);
		messageVo.setChatMemberNo(chatMemberNo);

		int cnt = chatMessageService.insertChatMessage(messageVo);
		logger.info("메시지 등록 결과 cnt={}",cnt);
		
		
		//3
		return cnt;
	}	
	
	
	@ResponseBody
	@RequestMapping("/ajax_selectChatRoomMessage")
	public List<Map<String, Object>> selectChatRoomMessage(@RequestParam (defaultValue = "0") int chatRoomNo){
		//1
		logger.info("채팅방별 메시지 출력 파라미터 chatRoomNo={}",chatRoomNo);
		
		//2
		List<Map<String, Object>> messageList = chatMessageService.selectChatRoomMessage(chatRoomNo);
		logger.info("채팅방별 메시지 검색 결과 messageList={}",messageList.size());
		
		//3
		return messageList;
	}
	

}

