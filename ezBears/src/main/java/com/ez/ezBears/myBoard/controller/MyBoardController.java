
package com.ez.ezBears.myBoard.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.ezBears.MBoard.model.MBoardService;
import com.ez.ezBears.MBoard.model.MBoardVO;
import com.ez.ezBears.member.model.MemberService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@Controller
@RequestMapping("/myBoard")
public class MyBoardController {
	private static final Logger logger = LoggerFactory.getLogger(MyBoardController.class);
	private final MemberService memberService;
	private final MBoardService mBoardService;
		
	//예지
	@RequestMapping("/addMyBoard")
	public String addMyBoard() {
		//1
		logger.info("마이보드 추가");
		
		//4
		return "/myBoard/addMyBoard";
	}
	
	@ResponseBody
	@PostMapping("/addMyBoard")
	public int addMyBoard_post(@ModelAttribute MBoardVO mBoardVo, HttpSession session) {
		//1
		logger.info("마이보드 추가 등록 파라미터 mBoardVo={}",mBoardVo);
		
		//2
		String userid=(String)session.getAttribute("userid");
		int memNo = memberService.selectMemberNo(userid);
		logger.info("멤버 번호 검색 결과 memNo={}",memNo);
		
		mBoardVo.setMBoardNo(memNo);
		int cnt = mBoardService.addBoard(mBoardVo);
		
		return cnt;
	}
	
	@ResponseBody
	@RequestMapping("/checkMBoardTitle")
	public int checkMBoardTitle(@RequestParam String mBoardName){
		//1
		logger.info("같은 이름의 보드 검색 파라미터 mBoardName="+mBoardName);
		//2
		int cnt = mBoardService.checkSameName(mBoardName);
		logger.info("같은 이름의 보드 검색 결과 cnt="+cnt);
		
		return cnt;
	}

	
	   //희진
	   /*팀별 결재 게시판 */
/*
	   @RequestMapping("/Approval")
	   public String Approval() {
	      logger.info("결재 리스트");
	      return "myBoard/Approval";
	   }
	   
	   @RequestMapping("/Approval_write")
	   public String Approval_wr() {
	      logger.info("결재 작성");
	      return "myBoard/Approval_write";
	   }
	   @RequestMapping("/Approval_edit")
	   public String Approval_edit() {
		   logger.info("결재 수정");
		   return "myBoard/Approval_edit";
	   }
	   
	   
	   @RequestMapping("/Approval_detail")
	   public String Approval_detail() {
	      logger.info("결재 디테일");
	      return "myBoard/Approval_detail";
	   }
	   
	   @RequestMapping("/Approval_delete")
	   public String Approval_delete() {
	      logger.info("결재 삭제");
	      return "myBoard/Approval_delete";
	   }
	   
	   /*
	    
	   
	   /*팀별 웹하드 게시판 */
	 /*   
	@RequestMapping("/webhard")
	   public String hard() {
	      logger.info("웹하드 리스트");
	      return "myBoard/webhard";
	   }   
	*/
	   @RequestMapping("/webhard_write")
	   public String hard_write() {
		   logger.info("웹하드 작성페이지");
		   return "myBoard/webhard_write";
	   }
	   
	   @RequestMapping("/webhard_edit")
	   public String hard_edit() {
		   logger.info("웹하드 수정");
		   return "myBoard/webhard_edit";
	   }
	   @RequestMapping("/webhard_detail")
	   public String hard_detail() {
		   logger.info("웹하드 디테일");
		   return "myBoard/webhard_detail";
	   }
	  
	   @RequestMapping("/webhard_delete")
	   public String hard_delete() {
	      logger.info("웹하드 삭제");
	      return "myBoard/webhard_delete";
	   }
	   
	   
		/* 캘린더 */
		/*
		  @RequestMapping("/Calender") public String Calender() { logger.info("캘린더 뷰");
		  return "myBoard/Calender"; }
		 */
}

