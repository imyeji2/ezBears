
package com.ez.ezBears.myBoard.controller;

import java.util.List;
import java.util.Map;

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
import com.ez.ezBears.myBoard.model.MyBoardListService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@Controller
@RequestMapping("/myBoard")
public class MyBoardController {
	private static final Logger logger = LoggerFactory.getLogger(MyBoardController.class);
	private final MemberService memberService;
	private final MBoardService mBoardService;
	private final MyBoardListService myBoardListService;
		
	//예지
	@RequestMapping("/addMyBoard")
	public String addMyBoard() {
		//1
		logger.info("마이보드 추가 로딩");
		
		
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
		
		List<Map<String, Object>> myBoardList = myBoardListService.selectBoardList(userid);
		session.setAttribute("myBoardList", myBoardList);
		
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
	

	
	@ResponseBody
	@RequestMapping("/editMyBoard")
	public List<Map<String, Object>> editMyBoard(Model model, HttpSession session) {
		//1
		logger.info("마이보드 수정");
		String userid = (String)session.getAttribute("userid");
		logger.info("마이보드 유저 검색 userid={}",userid);
		
		//2
		int adminMem = memberService.selectMemberNo(userid);
		List<Map<String, Object>> boardList = myBoardListService.selectAdminBoardList(adminMem);
		logger.info("보드 관리 boardList.size()={}",boardList.size());
		
		
		//3
		model.addAttribute("boardList",boardList);
	
		//4
		return boardList;
	}
	
	@ResponseBody
	@RequestMapping("/ajax_selectMyBoardMemList")
	public List<Map<String, Object>> selectMyBoardMemList(@RequestParam (defaultValue = "0") int mBoardNo){
		logger.info("마이보드 관리자 변경 관리자 리스트 조회 파라미터 mBoardNo={}",mBoardNo);
		
		List<Map<String, Object>> mem_list = myBoardListService.selectMyBoardMember(mBoardNo);
		logger.info("마이보드 멤버 정보 mem_list.size={}",mem_list.size());
		
		return mem_list;
	}
	
	
	@ResponseBody
	@RequestMapping("/ajax_updateMBoard")
	public int updateMBoard(@ModelAttribute MBoardVO mBoardVo) {
		logger.info("마이보드 정보 변경 파라미터 mBoardVo={}",mBoardVo);
		
		int cnt =mBoardService.updateMboard(mBoardVo);
		logger.info("마이보드 정보 변경 결과 cnt={}",cnt);
				
		return cnt;
	}
	
	@ResponseBody
	@RequestMapping("/ajax_delMBoard")
	public int delteMBoard(int mBoardNo, HttpSession session) {
		logger.info("마이보드 삭제 파라미터 mBoardNo{}",mBoardNo);
		
		String userid = (String)session.getAttribute("userid");
		
		int cnt = myBoardListService.deleteAdminBoard(mBoardNo);
		logger.info("마이보드 삭제 최종 cnt={}",cnt);
		
		List<Map<String, Object>> myBoardList = myBoardListService.selectBoardList(userid);
		session.setAttribute("myBoardList", myBoardList);
		
		return cnt;
	}
	
	@ResponseBody
	@RequestMapping("/ajax_checkBoardMemberCount")
	public int checkBoardMemberCount(int mBoardNo) {
		logger.info("마이보드 내부의 인원수 확인 파라미터 mBoardNo={}",mBoardNo);
		
		int cnt = myBoardListService.totalCountMboardMember(mBoardNo);
		logger.info("마이보드 내부 인원수 cnt={}",cnt);
		return cnt;
	}	

	
	   //희진
	   /*팀별 결재 게시판 */
  
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
	   
}

