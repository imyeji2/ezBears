package com.ez.ezBears.message.controller;

import java.math.BigDecimal;
import java.util.Iterator;
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

import com.ez.ezBears.member.model.MemberService;
import com.ez.ezBears.message.model.ListMessageReceiveVo;
import com.ez.ezBears.message.model.MessageReceiveVO;
import com.ez.ezBears.message.model.MessageSendVO;
import com.ez.ezBears.message.model.MessageService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/message")
@RequiredArgsConstructor
public class MessageController {
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	private final MemberService memberService;
	private final MessageService messageService;
	
	
	@RequestMapping("/messageList")
	public String message_list() {
		logger.info("메세지 페이지");
		return "message/messageList";
	}
	
	@GetMapping("/messageWrite")
	public String write_get(HttpSession session, @RequestParam(defaultValue = "0") int receiveNo,
			Model model) {
		logger.info("메세지 보내기 화면");
		
		//보내는 사람 세션에서 받아서 바로 보내기
		BigDecimal bigDecimalMemNo = (BigDecimal) session.getAttribute("memNo");

		// BigDecimal 값을 int로 변환
		int sendUserNo = bigDecimalMemNo.intValue();
		//String sendId = session.getAttribute("uesrid").toString();
		
		//받는 사람에 모든 member 띄우기
		List<Map<String, Object>> memList = memberService.selectAllMemberView();
		logger.info("멤버 띄우는 리스트, memList.size={}", memList.size());
		
		model.addAttribute("memList", memList);
		model.addAttribute("sendUserNo", sendUserNo);
		model.addAttribute("receiveNo", receiveNo);
		
		return "message/messageWrite";
	}
	
	@PostMapping("/messageWrite")
	public String write_post(@ModelAttribute MessageSendVO messageSendVo, @ModelAttribute MessageReceiveVO messageReceiveVo) {
		logger.info("입력 전 messageSendVo={}", messageSendVo);
		
		//보낸메세지에 추가
		int cnt = messageService.SendMessage(messageSendVo);
		logger.info("보낸 메세지, cnt={}", cnt);
		logger.info("입력 후 messageSendVo2={}", messageSendVo);
		
		int messageSendNo = messageSendVo.getMessageSendNo();
		logger.info("messageSendNo={}", messageSendNo);
		
		//받은메세지에 추가
		logger.info("messageReceiveVo={}",messageReceiveVo);
		int cnt2 = messageService.ReceiveMessage(messageSendNo, messageReceiveVo);
		logger.info("받은 메세지, cnt2={}", cnt2);
		
		
		return "redirect:/message/sendBox";
	}
	
	@RequestMapping("/sendBox")
	public String sendBox(HttpSession session, Model model) {
		//로그인 한 사람의 정보 구하기
		BigDecimal bigDecimalMemNo = (BigDecimal) session.getAttribute("memNo");

		// BigDecimal 값을 int로 변환
		int memNo = bigDecimalMemNo.intValue();
		logger.info("파라미터 memNo={}", memNo);
		
		//해당 memNo 이 sender 인 message 전부 조회
		List<Map<String, Object>> sendBoxList = messageService.selectSendBox(memNo);
		logger.info("보낸 메세지 총 갯수, sendBoxList.size()={}", sendBoxList.size());
		
		model.addAttribute("sendBoxList", sendBoxList);
		
		return "message/sendBox";
	}
	
	@RequestMapping("/receiveBox")
	public String receiveBox(HttpSession session, Model model) {
		//로그인 한 사람의 정보 구하기
		BigDecimal bigDecimalMemNo = (BigDecimal) session.getAttribute("memNo");

		// BigDecimal 값을 int로 변환
		int memNo = bigDecimalMemNo.intValue();
		logger.info("파라미터 memNo={}", memNo);
		
		//해당 memNo 이 receiver 인 message 전부 조회
		List<Map<String, Object>> receiveBoxList = messageService.selectReceiveBox(memNo);
		logger.info("받은 메세지 총 갯수, receiveBoxList.size={}", receiveBoxList.size());
		
		model.addAttribute("receiveBoxList", receiveBoxList);
		
		return "message/receiveBox";
	}
	
	@RequestMapping("/sendMessageDel")
	public String sendMessageDel(@RequestParam("messageSendNos") List<Integer> messageSendNos) {
		 // messageSendNos 리스트에 체크된 값이 들어옵니다.
	    // 이제 이 값을 사용하여 삭제 작업을 수행할 수 있습니다.
	    logger.info("보낸 쪽지 다중 삭제, messageSendNos={}", messageSendNos);
	    
	    // 삭제 작업 수행
	    int cnt = messageService.sendMessageDelMulti(messageSendNos);
	    logger.info("보낸 쪽지 다중 삭제 처리 결과, cnt={}",cnt);
		
	    //만약 보낸메세지함과 받은메세지함에서 모두 삭제처리 되었을 경우 db에서도 삭제
	    List<Integer> dropList = messageService.dropMessageList();
	    logger.info("수신함, 발신함 모두 삭제처리된 쪽지의 수 dropList.size={}",dropList.size());
	    
	    
	    if(dropList.size() > 0) {
	    	for(int dropNo : dropList) {
	    		int del = messageService.delMessage(dropNo);
	    	}
	    }
		
		return "redirect:/message/sendBox";
	}
	
	/*
	@RequestMapping("/receiveMessageDel")
	public String receiveMessageDel(@ModelAttribute ListMessageReceiveVo listMessageReceiveVo) {
		//logger.info("delNo={}", delNo);
		logger.info("다중삭제, listMessageReceiveVo={}", listMessageReceiveVo);
		
		//int cnt = messageService.receiveMessageDel(delNo);
		//logger.info("삭제 처리결과, cnt={}",cnt);
		List<MessageReceiveVO> list = listMessageReceiveVo.getReceiveMessages();
		logger.info("다중삭제, list.size={}",list.size());
		
		
		
		return "redirect:/message/receiveBox";
	}
	*/
	
	@RequestMapping("/receiveMessageDel")
	public String receiveMessageDel(@RequestParam("messageSendNos") List<Integer> messageSendNos) {
	    // messageSendNos 리스트에 체크된 값이 들어옵니다.
	    // 이제 이 값을 사용하여 삭제 작업을 수행할 수 있습니다.
	    logger.info("받은 쪽지 다중 삭제, messageSendNos={}", messageSendNos);
	    
	    // 삭제 작업 수행
	    int cnt = messageService.receiveMessageDelMulti(messageSendNos);
	    logger.info("받은 쪽지 다중 삭제 처리 결과, cnt={}",cnt);
	    
	    //만약 보낸메세지함과 받은메세지함에서 모두 삭제처리 되었을 경우 db에서도 삭제
	    List<Integer> dropList = messageService.dropMessageList();
	    logger.info("수신함, 발신함 모두 삭제처리된 쪽지의 수 dropList.size={}",dropList.size());
	    
	    if(dropList.size() > 0) {
	    	for(int dropNo : dropList) {
	    		int del = messageService.delMessage(dropNo);
	    	}
	    }
	    
	    return "redirect:/message/receiveBox";
	}
	
}
