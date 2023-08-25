package com.ez.ezBears.notice.controller;

import java.io.IOException;
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
import com.ez.ezBears.common.FileUploadUtil2;
import com.ez.ezBears.notice.model.NoticeService;
import com.ez.ezBears.notice.model.NoticeVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/notice")
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	private final NoticeService noticeService;
	private final FileUploadUtil2 fileUploadUtil;

	@RequestMapping("/noticeList")
	public String noticeList(@RequestParam(defaultValue = "0") int noticeNo,Model model ) {
		//1
		logger.info("공지사항 리스트 페이지 파라미터 noticeNo={}",noticeNo);
		
		//2
		List<Map<String, Object>> list=noticeService.selectNoticeList(noticeNo);
		logger.info("공지사항 리스트 페이지 결과 list.size={}",list);
		
		//3
		model.addAttribute("list",list);
		
		//4
		return "notice/noticeList";
	}
	
	@GetMapping("/noticeWrite")
	public String noticeWrite() {
		logger.info("공지사항 등록하기 페이지");
		return "notice/noticeWrite";
	}
	
	@PostMapping("/noticeWrite")
	public String noticeWrite_post(@ModelAttribute NoticeVO noticeVo,HttpServletRequest request,HttpSession session,
			Model model) {
		
		logger.info("글 등록 파라미터 noticeVo={}",noticeVo);
		String msg="등록 실패", url="/notice/noticeWrite";
		
		try {

			List<Map<String, Object>> files = fileUploadUtil.fileupload(request, ConstUtil.UPLOAD_NOTICE_FLAG);
			logger.info("업로드파일 정보 files={}", files);

			int cnt = noticeService.insertNotice(noticeVo);
			logger.info("공지사항 등록 결과 cnt = {}", cnt);
			
			if(cnt>0) {
				
				cnt=noticeService.insertFileNotice(files, noticeVo.getNoticeNo());
				logger.info("다중파일 업로드 결과 cnt={}",cnt);
				msg="글 작성 성공";
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		// 4.
		return "/common/message";
	}
	
	
	@RequestMapping("/noticeDetail")
	public String noticeDetail(@ModelAttribute NoticeVO noticeVo,@RequestParam(defaultValue = "0") int noticeNo,  Model model, HttpSession session) {
		//1
		logger.info("공지사항 디테일 화면 파라미터 noticeNo={}",noticeNo);
		
		String userid=(String)session.getAttribute("userid");
		logger.info("공지사항 아이디 userid={}",userid);
		
		//2
		Map<String, Object> map=noticeService.selectDetail(noticeNo);
		logger.info("공지사항 결과 map={}",map);
		
		List<Map<String, Object>> list=noticeService.selectNoticeList(noticeNo);
		logger.info("공지사항 리스트 페이지 결과 list.size={}",list.size());

		List<Map<String, Object>>filemap=noticeService.selectNoticeFile(noticeNo);
		logger.info("공지사항 리스트 파일 결과 filemap={}",filemap);
		
		List<Map<String, Object>>nextPage=noticeService.nextPage(noticeNo);
		logger.info("이전페이지 결과 nextPage={}",nextPage);
		
		/*
		 * List<Map<String, Object>>backPage=noticeService.backPage(noticeNo);
		 * logger.info("다음페이지 결과 backPage={}",backPage);
		 */
		
		//3.
		model.addAttribute("map",map);
		model.addAttribute("userid",userid);
		model.addAttribute("list",list);
		model.addAttribute("filemap",filemap);
		model.addAttribute("nextPage",nextPage);
		//model.addAttribute("backPage",backPage);
		
		return "notice/noticeDetail";
	}
	
}
