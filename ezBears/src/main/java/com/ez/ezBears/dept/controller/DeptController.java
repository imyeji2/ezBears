package com.ez.ezBears.dept.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.ezBears.MBoard.model.MBoardService;
import com.ez.ezBears.MBoard.model.MBoardVO;
import com.ez.ezBears.common.ConstUtil;
import com.ez.ezBears.common.PaginationInfo;
import com.ez.ezBears.common.SearchVO;
import com.ez.ezBears.dept.model.DeptService;
import com.ez.ezBears.dept.model.DeptVO;
import com.ez.ezBears.member.controller.MemberController;
import com.ez.ezBears.member.model.MemberService;
import com.ez.ezBears.staff.model.StaffService;
import com.ez.ezBears.team.model.TeamService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/dept")
@RequiredArgsConstructor
public class DeptController {
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	private final DeptService deptService;
	private final MBoardService mBoardService;
	private final MemberService memberService;
	private final TeamService teamService;
	private final StaffService staffService;
	
	@GetMapping("/list")
	public String list(@ModelAttribute SearchVO searchVo, Model model) {
		//1
		logger.info("부서 목록 페이지");
		
		//2
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		//deptVo
		List<DeptVO> list = deptService.selectDeptList();
		logger.info("부서 조회 결과, list.size={}", list.size());
		
		//팀원 수 
		int teamCnt = teamService.selectCntTeam();
		logger.info("팀원 조회 결과, teamCnt={}", teamCnt);
		
		//스태프 수 
		int staffCnt = staffService.selectCntStaff();
		logger.info("스태프 조회 결과, staffCnt={}", staffCnt);
		

		
		int totalRecord = deptService.totalList(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		
		//3
		model.addAttribute("list", list);
		model.addAttribute("teamCnt", teamCnt);
		model.addAttribute("staffCnt", staffCnt);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "dept/deptList";
	}
	
	
	@RequestMapping("/edit")
	public String edit(@ModelAttribute DeptVO deptVo, Model model) {
		//
		logger.info("부서 수정 파라미터 deptVo={}", deptVo);

		//2
		int result = deptService.editDept(deptVo);
		logger.info("부서 수정 결과, result={}",result);
		
		String msg = "수정에 실패하였습니다.", url ="/dept/list";
		if(result > 0) {
			
			
			msg = "수정되었습니다.";
		}
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4
		return "common/message";
	}
	
	@RequestMapping("/insert")
	public String insert(@ModelAttribute DeptVO deptVo, Model model) {
		//
		logger.info("부서 등록 파라미터 deptVo={}",deptVo);
		
		//2
		String deptName = deptVo.getDeptName();
		int cnt = deptService.checkDeptName(deptName);
		
		String msg = "부서 등록에 실패하였습니다.", url="/dept/list";
		if(cnt<1) {
			int result = deptService.insertDept(deptVo);
			logger.info("부서 등록");
			
			if(result>0) {
				int sameBoard = mBoardService.checkSameName(deptName);
				if(sameBoard < 1) {
					MBoardVO mBoardVo = new MBoardVO();
					mBoardVo.setMBoardName(deptName);
					
					int insertBoard = mBoardService.insertMBoard(mBoardVo);
					}
				
				msg = "부서가 등록되었습니다.";
			}
		}
		
		//3
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		
		//4
		return "common/message";
	}
	
	@RequestMapping("/delete") 
	@Transactional
	public String delete(@RequestParam int deptNo, Model model) {
	
		//1 
		logger.info("부서 삭제 파라미터 deptNo={}",deptNo);
	
		//2 
		//부서에 사원이 남아있는지 체크
		int memCnt = memberService.countMem(deptNo);
		logger.info("부서 잔여 사원 memCnt={}",memCnt);
		
		String msg = "부서 삭제에 실패하였습니다.", url="/dept/list";
		
		if(memCnt < 1) {
			
			//부서 삭제 처리
			int result = deptService.deleteDept(deptNo);
			logger.info("부서 삭제 처리 결과, result={}", result);
			
			if(result > 0) {
			
				msg = "부서가 삭제되었습니다.";
			}
		}else {
			msg = "부서에 남아있는 사원들을 이동해주세요.";
		}

		//3
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);

		//4
		return "common/message";
	}

}
