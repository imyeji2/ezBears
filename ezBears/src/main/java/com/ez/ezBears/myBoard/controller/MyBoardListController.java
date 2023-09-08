
package com.ez.ezBears.myBoard.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.ezBears.myBoard.model.MyBoardListService;
import com.ez.ezBears.myBoard.model.MyBoardListVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/myBoard")
@RequiredArgsConstructor
public class MyBoardListController {
	private static final Logger logger = LoggerFactory.getLogger(MyBoardListController.class);
	private final MyBoardListService myBoardListService;
	
	@RequestMapping("/myBoardList")
	public String selectMyBoardList(ModelMap model, HttpSession session){
		logger.info("동적보드 리스트 검색 페이지");
		
		String userid=(String)session.getAttribute("userid");
		
		if(userid!=null && !userid.isEmpty()) {
			List<Map<String, Object>> list = myBoardListService.selectBoardList(userid);
			logger.info("동적보드 리스트 검색 결과 list.size={}",list);
			
			model.addAttribute("boardlist",list);
		}
		
		return "inc/myBoardList";
	
	}
	
	@RequestMapping("/myBoardNavTab")
	public String selectNav(@ModelAttribute MyBoardListVO myBoardListVo,
			HttpSession session, Model  model) {
		//1
		String userid = (String)session.getAttribute("userid");
		logger.info("네비게이션 페이지 파라미터 myBoardListVo={}, userid={}",myBoardListVo,userid);		
		//2
		myBoardListVo.setMemId(userid);
		
		String mBoardName=myBoardListService.selectByMyBoardName(myBoardListVo);
		logger.info("팀 게시판 이름 검색 결과 mBoardName={}",mBoardName);
		
		//3
		model.addAttribute("mBoardName",mBoardName); 
		model.addAttribute("mBoardNo",myBoardListVo.getMBoardNo());
		
		//4.
		return "inc/myBoardNavTab";
	}
	
	

}


