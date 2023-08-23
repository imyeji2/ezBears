package com.ez.ezBears.webhard.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.ezBears.webhard.model.WebHardService;
import com.ez.ezBears.webhard.model.WebHardVO;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/myBoard")
@RequiredArgsConstructor
public class WebHardController {

	
	private static final Logger logger = LoggerFactory.getLogger(WebHardController.class);
	private final WebHardService webHardSerivce;
	
	
	@RequestMapping("/webhard")
	public String webHardList(@RequestParam (defaultValue = "0") int mBoardNo, Model model) {
		
		//
		logger.info("웹하드 리스트 출력 mBoardNo={}",mBoardNo);

		
		//
		/*
		  List<WebHardVO> list = webHardSerivce.selectAllWebHard(mBoardNo);
		  logger.info("웹하드 리스트 조회 결과");
		 */
		
		//
		//model.addAttribute("list",list);
		model.addAttribute("mBoardNo",mBoardNo);
		//
		return "/myBoard/webhard";
	}
	
	
	@GetMapping("/webhard_write")
	public String webHardget() {
		
		return null;
		
	}
	@PostMapping("/webhard_write")
	public String webHardpost(@ModelAttribute WebHardVO webHardVo, HttpServletRequest request, Model model) {
		//
		logger.info("웹하드 등록 파라미터 webHardVo={}",webHardVo);
		
		try {
			
		}catch (Exception e) {
			
		}
		
		return null;
		
	}
	
}