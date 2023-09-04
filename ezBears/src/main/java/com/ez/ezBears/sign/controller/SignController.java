package com.ez.ezBears.sign.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.ezBears.common.ConstUtil;
import com.ez.ezBears.common.PaginationInfo;
import com.ez.ezBears.common.SearchVO;
import com.ez.ezBears.common.SignListSearchVO;
import com.ez.ezBears.member.model.MemberService;
import com.ez.ezBears.member.model.MemberVO;
import com.ez.ezBears.myBoard.model.MyBoardInfoVO;
import com.ez.ezBears.myBoard.model.MyBoardListService;
import com.ez.ezBears.sign.model.SignService;
import com.ez.ezBears.sign.model.SignVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/myBoard")
public class SignController {
	/*
	  http://localhost:9091/ezBears/myBoard/Approval?myBoardNo=0
	 */

	private static final Logger logger = LoggerFactory.getLogger(SignController.class);
	private final MyBoardListService myBoardListService;
	private final SignService signService;
	private final MemberService memberService;
	
	@RequestMapping("/Approval")
	public String Approval(@RequestParam (defaultValue = "0") int mBoardNo,  @ModelAttribute SignListSearchVO  signListSearchVo,
			@ModelAttribute MyBoardInfoVO myBoardInfoVo, HttpSession session,Model model) {
		
		
		logger.info("결재 리스트 출력 mBoardNo={} ",mBoardNo);
		String userid = (String)session.getAttribute("userid");
		myBoardInfoVo.setMemId(userid);	
		myBoardInfoVo.setMBoardNo(mBoardNo);
	
		myBoardInfoVo = myBoardListService.selectBoardInfo(myBoardInfoVo);
		
		
		model.addAttribute("myBoardInfoVo",myBoardInfoVo);
		model.addAttribute("mBoardNo",mBoardNo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(signListSearchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT_FIVE);
				
		signListSearchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT_FIVE);
		signListSearchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		signListSearchVo.setDeptNo(myBoardInfoVo.getDeptNo());		
		
		logger.info("결재 부서번호 출력 deptNo={} ",signListSearchVo.getDeptNo());
		
		List<Map<String, Object>> list = signService.selectApprovalList(signListSearchVo);
		
		logger.info("list 사이즈 list={}", list.size());
		int totalCount = signService.selectAppCount(signListSearchVo);
		pagingInfo.setTotalRecord(totalCount);
		logger.info("totalCount={}",totalCount);
		
		//3
		model.addAttribute("list",list);
		model.addAttribute("mBoardNo",mBoardNo);
		model.addAttribute("pagingInfo",pagingInfo);
		
		
		return "myBoard/Approval";
	}

	@GetMapping("/Approval_write")
	public String Approval_wr(@RequestParam(defaultValue = "0") int mBoardNo,
			@ModelAttribute MyBoardInfoVO myBoardInfoVo, @ModelAttribute MemberVO memberVo , 
			HttpSession session ,Model model) {

		String userid = (String)session.getAttribute("userid");
		logger.info("결재 작성 mBoardNo={},userid={}",mBoardNo,userid);

		myBoardInfoVo.setMemId(userid);	
		myBoardInfoVo.setMBoardNo(mBoardNo);
		logger.info("myBoardInfo 정보={}",myBoardInfoVo);

		myBoardInfoVo = myBoardListService.selectBoardInfo(myBoardInfoVo);
		memberVo = memberService.selectpositioninfo(myBoardInfoVo.getDeptNo());
		
		model.addAttribute("myBoardInfoVo",myBoardInfoVo);
		model.addAttribute("memberVo",memberVo);
		
		logger.info("myBoardInfo={}",myBoardInfoVo);


		return "myBoard/Approval_write";
	}
	
	@PostMapping("/Approval_write")
	public String Approval_post(@RequestParam(defaultValue = "0") int mBoardNo,@ModelAttribute SignVO signVo) {
		
		logger.info("결재 등록 파라미터 ");
		
		
		int cnt = signService.insertApproval(signVo);
		logger.info("결재 게시글 등록 결과 cnt={}",cnt);
		
		return "redirect:/myBoard/Approval?mBoardNo="+mBoardNo;
	}
	
	

	@GetMapping("/Approval_edit")
	public String Approval_edit(@RequestParam (defaultValue = "0")int docNo) {
		logger.info("결재 수정 페이지");
		
		
		
		
		return "myBoard/Approval_edit";
	}


	@RequestMapping("/Approval_detail")
	public String Approval_detail(@RequestParam (defaultValue = "0")int docNo, @RequestParam(defaultValue = "0")int deptNo,
			@RequestParam(defaultValue = "0")int mBoardNo,@RequestParam (defaultValue = "0")int positionNo, @ModelAttribute SignVO signVo,
			@ModelAttribute MyBoardInfoVO myBoardInfoVo,@ModelAttribute MemberVO memberVo , HttpSession session,
			Model model) {
		
		String userid = (String)session.getAttribute("userid");
		logger.info("결재 디테일");
		
		myBoardInfoVo.setMemId(userid);			
		myBoardInfoVo = myBoardListService.selectMyBoardDept(userid);
		logger.info("myBoardInfoVo={}",myBoardInfoVo);
		
		memberVo = memberService.selectpositioninfo(myBoardInfoVo.getDeptNo());
		logger.info("결재 디테일 memberVo={}",memberVo);
		
		Map<String, Object> list = signService.detailSign(docNo);
		logger.info("결재 리스트 list={}",list);
		
		logger.info("결재 디테일 list={}",list.size());
		
		
		model.addAttribute("myBoardInfoVo",myBoardInfoVo);
		model.addAttribute("list",list);
		model.addAttribute("memberVo",memberVo);
		return "myBoard/Approval_detail";
	}
	
	@ResponseBody
	@PostMapping("/statusUpdate")
	public String statusUpdate(@RequestParam ("docNo") int docNo , @RequestParam("positionNo") int positionNo, @ModelAttribute SignVO signVo) {
		
		logger.info("결재 문서 번호 docNo={}",docNo);
		
		
		signVo = signService.updateStatus(docNo);
		
		
		return "myBoard/Approval";

	}

	@RequestMapping("/Approval_delete")
	public String Approval_delete() {
		logger.info("결재 삭제");
		return "myBoard/Approval_delete";
	}
}
