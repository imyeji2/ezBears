package com.ez.ezBears.notice.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.ezBears.notice.model.NoticeService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/notice")
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	private final NoticeService noticeService;

	@RequestMapping("/noticeList")
	public String noticeList() {
		//1
		logger.info("팀 공지사항 리스트 페이지");
		//2
		//3
		//4
		return "notice/noticeList";
	}
	
	@RequestMapping("/noticeWrite")
	public String teamNoticeWrite() {
		logger.info("팀 공지사항 등록하기 페이지");
		return "notice/noticeWrite";
	}
	
	@RequestMapping("/noticeDetail")
	public String teamBoardDetil(/* @RequestParam (defaultValue = "0")int no */) {
		logger.info("팀 공지사항 디테일 페이지 파라미터 no={}");
		return "notice/noticeDetail";
	}
	
}
