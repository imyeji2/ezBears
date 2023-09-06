package com.ez.ezBears.notice.controller;

import java.io.File;
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
import org.springframework.web.servlet.ModelAndView;

import com.ez.ezBears.common.ConstUtil;
import com.ez.ezBears.common.FileUploadUtil2;
import com.ez.ezBears.common.MyBoardSearchVo;
import com.ez.ezBears.common.PaginationInfo;
import com.ez.ezBears.common.SearchVO;
import com.ez.ezBears.member.model.MemberService;
import com.ez.ezBears.member.model.MemberVO;
import com.ez.ezBears.myBoard.model.MyBoardListVO;
import com.ez.ezBears.notice.model.NoticeFileListVO;
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
	public String noticeList(@RequestParam(defaultValue = "0") int noticeNo,
			@ModelAttribute SearchVO searchVo ,Model model ) {
		//1
		logger.info("공지사항 리스트 페이지 파라미터 noticeNo={}",noticeNo);
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
		List<Map<String, Object>> list=noticeService.selectAllNotice(searchVo);
		logger.info("공지사항 리스트 페이지 결과 list.size={}",list.size());

		int totalCount = noticeService.selectTotalCount(searchVo);
		pagingInfo.setTotalRecord(totalCount);
		logger.info("totalCount={}",totalCount);


		//3
		model.addAttribute("list",list);
		model.addAttribute("pagingInfo",pagingInfo);

		//4
		return "notice/noticeList";
	}

	@ResponseBody
	@RequestMapping("/notice_ajax")
	public Map<String, Object> notice_ajax(SearchVO searchVo) {
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
		List<Map<String, Object>> list=noticeService.selectAllNotice(searchVo);
		logger.info("공지사항 리스트 페이지 결과 list.size={}",list.size());

		int totalCount = noticeService.selectTotalCount(searchVo);
		pagingInfo.setTotalRecord(totalCount);
		logger.info("totalCount={}",totalCount);

		//3
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("list", list);
		resultMap.put("pagingInfo", pagingInfo);


		//4
		return resultMap;
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
				url="/notice/noticeList";
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
	public String noticeDetail(@ModelAttribute NoticeVO noticeVo,@RequestParam(defaultValue = "0") int noticeNo, 
			Model model, HttpSession session) {
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
			@ModelAttribute NoticeFileListVO  fileVo,
			HttpServletRequest request, Model model) {
		//1

		logger.info("공지사항 수정 처리 파라미터 noticeVo={},noticeNo={},fileVo={}",noticeVo,noticeNo,fileVo);

		List<NoticeFileVO> vo = fileVo.getFileNames();

		int cnt = noticeService.updateNotice(noticeVo);
		logger.info("팀별 공지사항 수정 결과 cnt={}",cnt);

		//		if(oldFileName!=null) {
		//			noticeService.deleteNoticeFile(noticeNo);
		//		}

		String fileName="", originalFileName="";
		long fileSize=0;

		try {
			String msg="공지사항 글 수정 실패";
			String url="/notice/noticeEdit?noticeNo="+noticeNo;

			if(cnt>0) {
					List<Map<String, Object>> list
					=fileUploadUtil.fileupload(request, ConstUtil.UPLOAD_NOTICE_FLAG);
					
					int cnt3 = noticeService.insertFileNotice(list, noticeNo);					
					
					if(cnt3 > 0) {
						if(vo.size() > 0) {
							noticeService.deleteNoticeFile(noticeNo);
							for(NoticeFileVO vo1 : vo) {
								String upPath
								=fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_NOTICE_FLAG); 
								File file= new File(upPath, vo1.getFileName()); 
								if(file.exists()) { 
									boolean
									bool=file.delete(); logger.info("글 수정- 파일삭제 여부:{}", bool); 
									} 
								}
							}
							noticeService.insertFileNotice(list, noticeNo);	
						}
				msg="공지사항 글 수정 성공";
				url="/notice/noticeDetail?noticeNo="+noticeNo;
			}//if
			
			//fileVo.setFileName(fileName);
			
			
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
	public String noticeDelte(@RequestParam (defaultValue = "0") int noticeNo, 
			Model model, HttpServletRequest request) {
		logger.info("공지사항 삭제 매개변수 noticeNo={}",noticeNo);

		//NoticeVO noticeVo=noticeService.selectnoticeByNo(noticeNo);
		List<Map<String, Object>> fileList=noticeService.selectnoticeFileByNo(noticeNo);

		int cnt=noticeService.deleteNotice(noticeNo);
		logger.info("공지사항 삭제 결과 cnt={}",cnt);
		noticeService.deleteNoticeFile(noticeNo);

		String msg="삭제 성공";
		String url="/notice/noticeList";

		for (Map<String, Object> fileMap : fileList) {
			String oldFileName = (String) fileMap.get("FILE_NAME"); // 맵에서 파일 이름 가져오기

			if (oldFileName != null && !oldFileName.isEmpty()) {
				String upPath = fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_NOTICE_FLAG);
				File file = new File(upPath, oldFileName);
				if (file.exists()) {
					boolean bool = file.delete();
					logger.info("파일 삭제 여부 : {}", bool);
				}
			}
		}


		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}


	@RequestMapping("/Filedownload")
	public ModelAndView downloadFile(@RequestParam(defaultValue = "0") int noticeNo,@RequestParam(defaultValue = "0") int noticeFileNo,
			@RequestParam String fileName,HttpServletRequest request) {

		logger.info("공지사항 파일 다운로드 파라미터 noticeNo={}, fileName={},noticeFileNo={}",noticeNo, fileName,noticeFileNo);

		int cnt=noticeService.updateDowncount(noticeFileNo);
		logger.info("다운로드 수 증가, 결과 cnt={}", cnt);

		Map<String, Object> map = new HashMap<>();

		String upPath = fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_NOTICE_FLAG);
		File file = new File(upPath, fileName);
		map.put("file", file);

		//ModelAndView(String viewName, Map<String, ?> model)
		ModelAndView mav = new ModelAndView("DownloadView", map);
		return mav;
	}


}
