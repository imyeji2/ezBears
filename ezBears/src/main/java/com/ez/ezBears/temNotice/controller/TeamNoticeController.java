package com.ez.ezBears.temNotice.controller;

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
import com.ez.ezBears.common.FileUploadUtil;
import com.ez.ezBears.common.MyBoardSearchVo;
import com.ez.ezBears.common.PaginationInfo;
import com.ez.ezBears.common.SearchVO;
import com.ez.ezBears.member.model.MemberService;
import com.ez.ezBears.myBoard.controller.MyBoardController;
import com.ez.ezBears.myBoard.model.MyBoardListService;
import com.ez.ezBears.temNotice.model.TeamNoticeService;
import com.ez.ezBears.temNotice.model.TeamNoticeVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/myBoard")
@RequiredArgsConstructor
public class TeamNoticeController {
	private static final Logger logger = LoggerFactory.getLogger(MyBoardController.class);
	private final MyBoardListService myBoardListService;
	private final MemberService memberService;
	private final FileUploadUtil fileUploadUtil;	
	private final TeamNoticeService teamNoticeService;
	
	//예지
	/*팀별 공지사항 게시판 */
	@RequestMapping("/teamNotice")
	public String teamNotice(@RequestParam (defaultValue = "0") int mBoardNo, 
			MyBoardSearchVo searchVo,Model  model) {
		//1.
		logger.info("팀 공지사항 리스트 페이지, 파라미터 mBoardNo={}",mBoardNo);
		
		
		//2
		//페이징 처리
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setMBoardNo(mBoardNo);
		
		List<Map<String, Object>> list = teamNoticeService.selectTeamNoticeList(searchVo);
		logger.info("팀 공지사항 리스트 조회 결과 list.size={}",list.size());
		
		//3
		model.addAttribute("list",list);
		model.addAttribute("myBoardNo",mBoardNo);
		model.addAttribute("pagingInfo",pagingInfo);
		
		//4
		return "myBoard/teamNoticeList";
	}
	
	
	@GetMapping("/teamNoticeDetail")
	public String teamBoardDetil(@RequestParam (defaultValue = "0") int myBoardNo,
			Model model) {
		//1
		logger.info("팀 공지사항 디테일 화면, 파라미터 myBoardNo={}",myBoardNo);
		
		//2
		String myBoardName=myBoardListService.selectByMyBoardName(myBoardNo);
		logger.info("팀 게시판 이름 찾기 결과 myBoardName={}",myBoardName);
		
		//3.
		model.addAttribute("myBoardNo",myBoardNo);
		model.addAttribute("myBoardName",myBoardName);
		
		return "myBoard/teamNoticeDetail";
	}
	
	

		
	
	@GetMapping("/teamNoticeWrite")
	public String teamNoticeWrite(@RequestParam (defaultValue = "0") int myBoardNo,
			Model model, HttpSession session) {
		//1.
		logger.info("팀 공지사항 등록하기 페이지");
		String userid=(String)session.getAttribute("userid");
		logger.info("userid={}",userid);
		
		//2
		int userNo = memberService.selectMemberNo(userid);
		logger.info("회원 아이디 userid={}, 회원 번호 userNo={}",userid,userNo);
		
		String myBoardName=myBoardListService.selectByMyBoardName(myBoardNo);
		logger.info("팀 게시판 이름 찾기 결과 myBoardName={}",myBoardName);

		//3.
		model.addAttribute("myBoardNo",myBoardNo);
		model.addAttribute("userNo",userNo);
		model.addAttribute("myBoardName",myBoardName);
		
		
		//4.
		return "myBoard/teamNoticeWrite";
	}
	
	
	@PostMapping("/teamNoticeWrite")
	public String teamNoticeWrite_post(@ModelAttribute TeamNoticeVO teamNoticeVo,
			HttpServletRequest request, Model model) {
		
		//1
		logger.info("팀 공지사항 등록, 파라미터 TeamNoticeVO={}",teamNoticeVo);
		
		try {
			List<Map<String, Object>> fileList
			=fileUploadUtil.fileupload(request, ConstUtil.UPLOAD_TEAMNOTICE_FLAG);

			String fileName="", originalFileName="";
			long fileSize = 0;
			for(Map<String, Object> map : fileList) {
				fileName=(String) map.get("fileName");
				originalFileName=(String) map.get("originalFileName");
				fileSize= (long) map.get("fileSize");				
			}//for

			teamNoticeVo.setFileName(fileName);
			teamNoticeVo.setOriginname(originalFileName);
			teamNoticeVo.setFsize(fileSize);	
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		int cnt=teamNoticeService.insertTeamNotice(teamNoticeVo);
		logger.info("글쓰기 결과, cnt={}", cnt);
		
		//3
		//4
		return "redirect:/myBoard/teamNotice?myBoardNo="+teamNoticeVo.getMyBoardNo();
	}
	
}
