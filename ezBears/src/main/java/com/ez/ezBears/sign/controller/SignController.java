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

import com.ez.ezBears.common.ConstUtil;
import com.ez.ezBears.common.PaginationInfo;
import com.ez.ezBears.common.SearchVO;
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
	
	
	@RequestMapping("/Approval")
	public String Approval(@RequestParam (defaultValue = "0") int mBoardNo, @ModelAttribute SearchVO searchVo ,Model model) {
		logger.info("결재 리스트 출력 mBoardNo={}",mBoardNo);

		model.addAttribute("mBoardNo",mBoardNo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT_FIVE);
				
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT_FIVE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
				
		List<Map<String, Object>> list = signService.selectApprovalList(searchVo);
		
		logger.info("list 사이즈 list={}", list.size());
		int totalCount = signService.selectAppCount(searchVo);
		pagingInfo.setTotalRecord(totalCount);
		logger.info("totalCount={}",totalCount);
		
		//3
		model.addAttribute("list",list);
		model.addAttribute("mBoardNo",mBoardNo);
		model.addAttribute("pagingInfo",pagingInfo);
		
		
		return "myBoard/Approval";
	}

	@GetMapping("/Approval_write")
	public String Approval_wr(@RequestParam(defaultValue = "0") int mBoardNo, @ModelAttribute MyBoardInfoVO myBoardInfoVo, 
			HttpSession session ,Model model) {

		String userid = (String)session.getAttribute("userid");
		logger.info("결재 작성 mBoardNo={},userid={}",mBoardNo,userid);
		myBoardInfoVo.setMemId(userid);	
		myBoardInfoVo.setMBoardNo(mBoardNo);
		logger.info("myBoardInfo 정보={}",myBoardInfoVo);

		myBoardInfoVo = myBoardListService.selectBoardInfo(myBoardInfoVo);

		model.addAttribute("myBoardInfoVo",myBoardInfoVo);

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
}
