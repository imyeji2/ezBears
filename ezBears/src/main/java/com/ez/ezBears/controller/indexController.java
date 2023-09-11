package com.ez.ezBears.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ez.ezBears.MBoard.model.MBoardService;
import com.ez.ezBears.common.MyBoardSearchVo;
import com.ez.ezBears.member.model.MemberService;
import com.ez.ezBears.myBoard.model.MyBoardListService;
import com.ez.ezBears.myBoard.model.MyBoardService;
import com.ez.ezBears.myBoard.model.MyBoardVO;
import com.ez.ezBears.notice.model.NoticeService;
import com.ez.ezBears.record.game.model.GameService;
import com.ez.ezBears.record.game.model.GameVO;
import com.ez.ezBears.teamWorkBoard.model.ToDoListDetailService;
import com.ez.ezBears.temNotice.model.TeamNoticeService;

import jakarta.servlet.http.HttpSession;
import kotlin.reflect.jvm.internal.impl.descriptors.ConstUtil;
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
	private final MyBoardListService myBoardListService;
	private final GameService gameService;
	
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
			searchVo.setLastRecordIndex(6);
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
			}else{
				List<GameVO> gameVo = gameService.selectAllGameMain();
				logger.info("경기기록 조회 결과 gameVo={}",gameVo);
				model.addAttribute("gameVo",gameVo);
			}
			
			model.addAttribute("noticeList",noticeList);
			model.addAttribute("type",type);
			logger.info("인덱스페이지로 이동 userid={}",userid);
			result="index";
		}
		
		
		return result;
	}
	

	@ResponseBody
	@RequestMapping("ajax_selectMyBoardList")
	List<Map<String, Object>> selectMyBoardList(HttpSession session){
		
		//1
		logger.info("메인페이지 보드 변경하기, 마이보드 리스트 검색");
		
		//2
		String userid=(String)session.getAttribute("userid");
		List<Map<String, Object>> myBoardList = myBoardListService.selectBoardList(userid);
		
		logger.info("마이보드 리스트 검색 결과 myBoardList.size={}",myBoardList);
		
		return myBoardList;
		
	}
	
	@ResponseBody
	@RequestMapping("ajax_updateMainBoard")
	public int updateMainBoard(@RequestParam (defaultValue = "0") int mBoardNo,
			HttpSession session){
		
		//1
		logger.info("메인 보드 업데이트 파라미터 mBoardNo={}",mBoardNo);
		String userid = (String)session.getAttribute("userid");
		int memNo = memberService.selectMemberNo(userid);
		
		//2
		MyBoardVO vo = new MyBoardVO();
		vo.setMBoardNo(mBoardNo);
		vo.setMemNo(memNo);
		int cnt = myBoardListService.updateMainBoardService(vo);
		
		//4
		return cnt;
		
	}
	
	@ResponseBody
	@RequestMapping("ajax_winRate")
	public List<Map<String, Object>> WinRate(Model model, HttpSession session) {
		List<Map<String, Object>> winlist = gameService.selectMonthlyWinRate();
		model.addAttribute("winlist", winlist);
		logger.info("승률 통계", winlist);
		return winlist;
	}
}