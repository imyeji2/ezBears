package com.ez.ezBears.controller;

import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;

import org.apache.catalina.connector.Response;
import org.apache.taglibs.standard.tag.el.fmt.RequestEncodingTag;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.ez.ezBears.MBoard.model.MBoardService;
import com.ez.ezBears.common.MyBoardSearchVo;
import com.ez.ezBears.common.SearchVO;
import com.ez.ezBears.dept.model.DeptService;
import com.ez.ezBears.member.model.MemberService;
import com.ez.ezBears.myBoard.model.MyBoardListService;
import com.ez.ezBears.myBoard.model.MyBoardService;
import com.ez.ezBears.notice.model.NoticeService;
import com.ez.ezBears.teamWorkBoard.model.ToDoListDetailService;
import com.ez.ezBears.temNotice.model.TeamNoticeService;
import com.oracle.wls.shaded.org.apache.xml.utils.URI;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class indexController {
	private static final Logger logger = LoggerFactory.getLogger(indexController.class);
	private final NoticeService noticeService;
	private final TeamNoticeService teamNoticeService;
	private final MemberService memberService;
	private final MyBoardService myBoardService;
	private final MBoardService mBoardService;
	private final ToDoListDetailService todolistDetailService;
	
	@RequestMapping("/")
	public String index(HttpSession session,Model model,
			@ModelAttribute MyBoardSearchVo searchVo) {
		
		logger.info("index 페이지");
		String userid=(String) session.getAttribute("userid");
		
		String result="";
		if(userid==null || userid.isEmpty()) {
			logger.info("로그인페이지 이동");
			result="login/login";
		}else {
			
			//메인 페이지 공지사항
			searchVo.setLastRecordIndex(5);
			List<Map<String, Object>> noticeList = noticeService.selectMainNotice(searchVo);
			logger.info("메인 공지사항 리스트 noticeList.size()",noticeList);
			
			String type=(String)session.getAttribute("type");
			logger.info("멤버 타입 type={}",type);
			
			if(type.equals("사원")) {
				//부서보드
				int memNo = memberService.selectMemberNo(userid);
				int mBoardNo = myBoardService.selectMainMboardNo(memNo);
				String mBoardName = mBoardService.selectMboardName(mBoardNo);
				searchVo.setMBoardNo(mBoardNo);
				List<Map<String, Object>> myNoticeList = teamNoticeService.selectMainTeamNoticeList(searchVo);
				
				//달성률
				int totalCount = todolistDetailService.totalMemberTodolist(memNo);//전체
				var completedCount = todolistDetailService.completeMemberTodolist(memNo);//완료
				var incompleteCount = todolistDetailService.incompleteMemberTodolist(memNo);//미완료
				
				model.addAttribute("myNoticeList",myNoticeList);
				model.addAttribute("mBoardName",mBoardName);
				model.addAttribute("totalCount",totalCount);
				model.addAttribute("completedCount",completedCount);
				model.addAttribute("incompleteCount",incompleteCount);
				model.addAttribute("mBoardNo",mBoardNo);
				
				
				
			}else {
				
			}
			model.addAttribute("noticeList",noticeList);
			model.addAttribute("type",type);
			logger.info("인덱스페이지로 이동 userid={}",userid);
			result="index";
		}
		
		
		return result;
	}
	

	
}