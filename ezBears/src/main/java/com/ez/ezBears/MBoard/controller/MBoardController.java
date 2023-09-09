package com.ez.ezBears.MBoard.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ez.ezBears.MBoard.model.MBoardService;
import com.ez.ezBears.MBoard.model.MBoardVO;
import com.ez.ezBears.common.ConstUtil;
import com.ez.ezBears.common.PaginationInfo;
import com.ez.ezBears.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/mboard")
@RequiredArgsConstructor
public class MBoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(MBoardController.class);
	private final MBoardService mBoardService;
	
	@RequestMapping("/list")
	public String list(@ModelAttribute SearchVO searchVo, Model model) {
		
		//1
		logger.info("게시판 보여주기, searchVo={}",searchVo);
		
		//2
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<MBoardVO> list = mBoardService.selectAllboard(searchVo);
		
	    for (MBoardVO mBoardVO : list) {
	        if (mBoardVO.getDeptName() == null) {
	            mBoardVO.setDeptName("경영지원팀");
	            mBoardVO.setDeptTel("02-592-0001");
	        }
	    }
		
		logger.info("게시판 보여주기 결과, list.size={}",list.size());
		
		int totalRecord = mBoardService.totalBoardList(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		
		//3
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		//4
		return "mBoard/mboardList";
	}
}
