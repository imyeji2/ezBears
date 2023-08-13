
package com.ez.ezBears.myBoard.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.ezBears.myBoard.model.MyBoardListService;

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
}

