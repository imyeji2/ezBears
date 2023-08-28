package com.ez.ezBears.notice.controller;

import java.io.File;
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
import com.ez.ezBears.member.model.MemberService;
import com.ez.ezBears.member.model.MemberVO;
import com.ez.ezBears.myBoard.model.MyBoardListVO;
import com.ez.ezBears.notice.model.NoticeFileVO;
import com.ez.ezBears.notice.model.NoticeService;
import com.ez.ezBears.notice.model.NoticeVO;
import com.ez.ezBears.temNotice.model.TeamNoticeVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/notice")
public class NoticeController {
	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);

	private final NoticeService noticeService;
	private final MemberService memberService;
	private final FileUploadUtil2 fileUploadUtil;

	private List<Map<String, Object>> files;

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
		//String type="write";
		logger.info("글 등록 파라미터 noticeVo={}",noticeVo);
		String msg="등록 실패", url="/notice/noticeWrite";
		try {
			List<Map<String, Object>> files = fileUploadUtil.fileupload(request, ConstUtil.UPLOAD_NOTICE_FLAG);
			logger.info("업로드파일 정보 files={}", files);

			int cnt = noticeService.insertNotice(noticeVo);
			logger.info("공지사항 등록 결과 cnt = {}", cnt);

			if(cnt>0) {
				int cnt2=noticeService.insertFileNotice(files, noticeVo.getNoticeNo());
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
		return "common/message"; // 메시지 출력 페이지로 이동
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

		//3.
		model.addAttribute("map",map);
		model.addAttribute("userid",userid);
		model.addAttribute("list",list);
		model.addAttribute("filemap",filemap);
		model.addAttribute("nextPage",nextPage);
		//model.addAttribute("backPage",backPage);

		return "notice/noticeDetail";
	}


	@GetMapping("/noticeEdit")
	public String noticeEdit(@ModelAttribute MemberVO memberVo,@ModelAttribute NoticeFileVO noticeFileVo,
			@RequestParam (defaultValue = "0") int noticeNo,Model model, HttpSession session) {
		//1
		String userid = (String)session.getAttribute("userid");
		String type="edite";
		logger.info("공지사항 수정 페이지 noticeFileVo,userid={}",noticeFileVo,userid);

		//2
		memberVo.setMemId(userid);

		Map<String, Object>map=noticeService.selectDetail(noticeNo);
		List<Map<String, Object>> list=noticeService.selectNoticeFile(noticeNo);

		logger.info("공지사항 디테일 map={}",map);
		logger.info("파일 list.size={}",list);

		//3
		model.addAttribute("map",map);
		model.addAttribute("list",list);
		model.addAttribute("memberVo",memberVo);
		model.addAttribute("noticeNo",noticeNo);
		model.addAttribute("type",type);

		//4
		return "/notice/noticeWrite";
	}


	@PostMapping("/noticeEdit")
	public String noticeEdit_post(@ModelAttribute NoticeVO noticeVo,
			@RequestParam(defaultValue = "0") int noticeNo,
			@RequestParam(required = false) String oldFileName,
			HttpServletRequest request, Model model) {
		//1
		logger.info("공지사항 수정 처리 파라미터 noticeVo={},noticeNo={}",noticeVo,noticeNo);


		int cnt = noticeService.updateNotice(noticeVo);
		logger.info("팀별 공지사항 수정 결과 cnt={}",cnt);

		if(oldFileName!=null) {
			noticeService.deleteNoticeFile(noticeNo);
		}

		String fileName="", originalFileName="";
		List<Map<String, Object>> files;

		try {
			files = fileUploadUtil.fileupload(request, ConstUtil.UPLOAD_NOTICE_FLAG);
			logger.info("업로드파일 정보 files={}", files);

			int cnt2=noticeService.insertFileNotice(files, noticeVo.getNoticeNo());
			logger.info("다중파일 업로드 결과 cnt2={}",cnt2);

			//2
			String msg="공지사항 글 수정 실패";
			String url="/notice/noticeEdit?noticeNo="+noticeNo;

			if(cnt>0) {

				msg="공지사항 글 수정 성공";
				url="/notice/noticeDetail?noticeNo="+noticeNo;

				if(files!=null && !files.isEmpty()) { //
					if(oldFileName!=null && !oldFileName.isEmpty()) {//
						String upPath
						=fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_NOTICE_FLAG);
						File file= new File(upPath,oldFileName);
						if(file.exists()) {
							boolean bool=file.delete();
							logger.info("글 수정- 파일삭제 여부:{}", bool);
						}
					}
				}
			}//if

			//3
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);

		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		//4
		return "common/message";
	}


	@RequestMapping("/noticeDelte")
	public String noticeDelte(@RequestParam (defaultValue = "0") int noticeNo,@RequestParam(required = false)  String oldFileName, Model model, HttpServletRequest request) {
		logger.info("공지사항 삭제 매개변수 noticeNo={}",noticeNo);

		NoticeVO noticeVo=noticeService.selectnoticeByNo(noticeNo);
		
		int cnt=noticeService.deleteNotice(noticeNo);
		logger.info("공지사항 삭제 결과 cnt={}",cnt);

		String msg="삭제 성공";
		String url="/notice/noticeList";

		if(oldFileName!=null && !oldFileName.isEmpty()) { //
			String upPath=fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_NOTICE_FLAG);
			File file = new File(upPath,oldFileName);
			if(file.exists()) {
				boolean bool=file.delete();
				logger.info("파일 삭제 여부 : {}", bool);
			}
		}
		
		noticeService.deleteNoticeFile(noticeNo);

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}




}
