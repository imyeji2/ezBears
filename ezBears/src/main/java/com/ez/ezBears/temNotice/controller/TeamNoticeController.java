package com.ez.ezBears.temNotice.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.ezBears.myBoard.controller.MyBoardController;

@Controller
@RequestMapping("/myBoard")
public class TeamNoticeController {
	private static final Logger logger = LoggerFactory.getLogger(MyBoardController.class);

	//예지
	/*팀별 공지사항 게시판 */
	@RequestMapping("/teamNotice")
	public String teamNotice(@RequestParam (defaultValue = "0") int myBoardNo, Model model) {
		logger.info("팀 공지사항 리스트 페이지, 파라미터 myBoardNo={}", myBoardNo);
		
		
		if(myBoardNo<1) {
			
		}else {
			
			model.addAttribute("myBoardNo",myBoardNo);
		}
		
		return "myBoard/teamNoticeList";
	}
	
	
	@RequestMapping("/teamNoticeDetail")
	public String teamBoardDetil(/* @RequestParam (defaultValue = "0")int no */) {
		logger.info("팀 공지사항 디테일 페이지 파라미터 no={}");
		return "myBoard/teamNoticeDetail";
	}
	
	
	@RequestMapping("/teamNoticeWrite")
	public String teamNoticeWrite() {
		logger.info("팀 공지사항 등록하기 페이지");
		return "myBoard/teamNoticeWrite";
	}
	
}
