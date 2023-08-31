package com.ez.ezBears.board.controller;

import java.io.IOException;
import java.util.HashMap;
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

import com.ez.ezBears.board.model.BoardService;
import com.ez.ezBears.board.model.BoardVO;
import com.ez.ezBears.common.ConstUtil;
import com.ez.ezBears.common.FileUploadUtil2;
import com.ez.ezBears.common.PaginationInfo;
import com.ez.ezBears.common.SearchVO;
import com.ez.ezBears.notice.model.NoticeVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/board")
@RequiredArgsConstructor
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	private final BoardService boardService;
	private final FileUploadUtil2 fileUploadUtil;

	@RequestMapping("/boardList")
	public String boardList(@RequestParam(defaultValue = "0") int boardNo,
			@ModelAttribute SearchVO searchVo,Model model) {
		logger.info("공지사항 리스트 페이지 파라미터 boardNo={}",boardNo);
		logger.info("공지사항 검색 파라미터 searchVo={}", searchVo);

		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT_FIVE);

		//2)searchVo에 값 세팅 -> xml에 전달할 값 
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT_FIVE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		//2
		//List<Map<String, Object>> list=noticeService.selectNoticeList(noticeNo);
		List<Map<String, Object>> list=boardService.selectAllBoard(searchVo);
		logger.info("공지사항 리스트 페이지 결과 list.size={}",list.size());

		int totalCount = boardService.selectTotalCount(searchVo);
		pagingInfo.setTotalRecord(totalCount);
		logger.info("totalCount={}",totalCount);


		//3
		model.addAttribute("list",list);
		model.addAttribute("pagingInfo",pagingInfo);
		return "board/boardList";
	}
	
	@ResponseBody
	@RequestMapping("/board_ajax")
	public Map<String, Object> board_ajax(SearchVO searchVo, @RequestParam int randomNumber) {
	    //1.
	    logger.info("팀 공지사항 리스트 페이지, 파라미터 searchVo={}",searchVo);

	    //2
	    //페이징 처리
	    //[1]PaginationInfo 객체 생성
	    PaginationInfo pagingInfo = new PaginationInfo();
	    pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
	    pagingInfo.setCurrentPage(searchVo.getCurrentPage());
	    pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT_FIVE);
	    
	    //2)searchVo에 값 세팅 -> xml에 전달할 값 
	    searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT_FIVE);
	    searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
	    
	    //2
	    //List<Map<String, Object>> list=noticeService.selectNoticeList(noticeNo);
	    List<Map<String, Object>> list = boardService.selectAllBoard(searchVo);
	    logger.info("공지사항 리스트 페이지 결과 list.size={}", list.size());
	    
	    int totalCount = boardService.selectTotalCount(searchVo);
	    pagingInfo.setTotalRecord(totalCount);
	    logger.info("totalCount={}", totalCount);
	    
	    //3
	    // 랜덤 값을 저장하는 로직
	    saveRandomNumber(randomNumber);

	    Map<String, Object> resultMap = new HashMap<>();
	    resultMap.put("list", list);
	    resultMap.put("pagingInfo", pagingInfo);

	    //4
	    return resultMap;
	}
	
	@GetMapping("/boardWrite")
	public String boardWrite() {
		logger.info("공지사항 등록하기 페이지");
		return "board/boardWrite";
	}

	@PostMapping("/boardWrite")
	public String boardWrite_post(@ModelAttribute BoardVO boardVo,HttpServletRequest request,HttpSession session,
			Model model) {
		//String type="write";
		logger.info("글 등록 파라미터 boardVo={}",boardVo);
		String msg="등록 실패", url="/board/boardWrite";
		try {
			List<Map<String, Object>> files = fileUploadUtil.fileupload(request, ConstUtil.UPLOAD_NOTICE_FLAG);
			logger.info("업로드파일 정보 files={}", files);

			int cnt = boardService.insertBoard(boardVo);
			logger.info("공지사항 등록 결과 cnt = {}", cnt);

			/*
			 * if(cnt>0) { int cnt2=noticeService.insertFileNotice(files,
			 * noticeVo.getNoticeNo()); msg="글 작성 성공"; url="/notice/noticeList"; }
			 */
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		// 4.
		return "common/message"; // 메시지 출력 페이지로 이동
	}
	
	
}
