package com.ez.ezBears.notice.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.ezBears.notice.model.NoticeService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/notice")
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	private final NoticeService noticeService;

	@RequestMapping("/noticeList")
	public String noticeList(@RequestParam(defaultValue = "0") int noticeNo,Model model ) {
		//1
		logger.info("공지사항 리스트 페이지 파라미터 noticeNo={}",noticeNo);
		
		//2
		List<Map<String, Object>> list=noticeService.selectNoticeList(noticeNo);
		logger.info("공지사항 리스트 페이지 결과 list.size={}",list);
		
		//3
		model.addAttribute("list",list);
		
		//4
		return "notice/noticeList";
	}
	
	@RequestMapping("/noticeWrite")
	public String teamNoticeWrite() {
		logger.info("공지사항 등록하기 페이지");
		return "notice/noticeWrite";
	}
	
	@RequestMapping("/noticeDetail")
	public String teamBoardDetil(@RequestParam(defaultValue = "0") int noticeNo,  Model model, HttpSession session) {
		//1
		logger.info("공지사항 디테일 화면 파라미터 noticeNo={}",noticeNo);
		
		String userid=(String)session.getAttribute("userid");
		logger.info("공지사항 아이디 userid={}",userid);
		
		//2
		Map<String, Object> map=noticeService.selectDetail(noticeNo);
		logger.info("공지사항 결과 map={}",map);
		
		List<Map<String, Object>> list=noticeService.selectNoticeList(noticeNo);
		logger.info("공지사항 리스트 페이지 결과 list.size={}",list.size());

		//3.
		model.addAttribute("map",map);
		model.addAttribute("userid",userid);
		model.addAttribute("list",list);
		
		return "notice/noticeDetail";
	}
	
}
