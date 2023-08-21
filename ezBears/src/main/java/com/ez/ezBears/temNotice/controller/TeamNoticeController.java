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
import com.ez.ezBears.myBoard.model.MyBoardListVO;
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
	/*팀별 공지사항 게시판 리스트 */
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
		
		int totalCount = teamNoticeService.selectTotalCount(searchVo);
		
		//3
		model.addAttribute("list",list);
		model.addAttribute("mBoardNo",mBoardNo);
		model.addAttribute("pagingInfo",pagingInfo);
		model.addAttribute("totalCount",totalCount);
		
		//4
		return "myBoard/teamNoticeList";
	}
	

	//팀별 공지사항 글 등록 화면
	@GetMapping("/teamNoticeWrite")
	public String teamNoticeWrite(@ModelAttribute MyBoardListVO myBoardListVo,
			Model model, HttpSession session) {
		//1.
		logger.info("팀 공지사항 등록하기 페이지");
		
		String userid=(String)session.getAttribute("userid");
		logger.info("팀 동지사항 등록 페이지 파라미터 myBoardListVo={},userid={}",myBoardListVo,userid);
		
		//2
		myBoardListVo.setMemId(userid);
		
		myBoardListVo=myBoardListService.selectMyBoardInfo(myBoardListVo);
		logger.info("팀 게시판 정보 찾기 결과 myBoardListVo={}",myBoardListVo);
		

		//3.
		model.addAttribute("myBoardListVo",myBoardListVo);

		//4.
		return "myBoard/teamNoticeWrite";
	}
	
	
	//팀별 공지사항 글 등록
	@PostMapping("/teamNoticeWrite")
	public String teamNoticeWrite_post(@ModelAttribute TeamNoticeVO teamNoticeVo,
			@RequestParam(defaultValue = "0") int mBoardNo,HttpServletRequest request, Model model) {
		
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
		return "redirect:/myBoard/teamNotice?mBoardNo="+mBoardNo;
	}
	
	
	//팀별 공지사항 디테일 페이지
	@RequestMapping("/teamNoticeDetail")
	public String teamBoardDetil(@ModelAttribute TeamNoticeVO teamNoticeVo,
			Model model) {
		//1
		logger.info("팀 공지사항 디테일 화면, 파라미터 teamNoticeVo={}",teamNoticeVo);
		
		//2
		Map<String, Object> map = teamNoticeService.selectDetail(teamNoticeVo);
		logger.info("팀 공지사항 디테일 결과 map={}",map);
		
		//System.out.println((int) detileMap.get("MY_BOARD_NO"));
		
		String myBoardName = myBoardListService.selectByBoardName(teamNoticeVo.getTeamNoticeNo());
		logger.info("마이보드 이름 myBoardName={}",myBoardName);	

		//3.
		model.addAttribute("map",map);
		model.addAttribute("myBoardName",myBoardName);
		
		return "myBoard/teamNoticeDetail";
	}
	
	
}
