package com.ez.ezBears.sign.controller;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
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
import com.ez.ezBears.common.FileUploadUtil;
import com.ez.ezBears.common.PaginationInfo;
import com.ez.ezBears.common.SignListSearchVO;
import com.ez.ezBears.member.model.MemberService;
import com.ez.ezBears.member.model.MemberVO;
import com.ez.ezBears.myBoard.model.MyBoardInfoVO;
import com.ez.ezBears.myBoard.model.MyBoardListService;
import com.ez.ezBears.notice.model.NoticeFileVO;
import com.ez.ezBears.sign.model.SignFileVO;
import com.ez.ezBears.sign.model.SignMemInfoVO;
import com.ez.ezBears.sign.model.SignService;
import com.ez.ezBears.sign.model.SignVO;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/myBoard")
public class SignController { 
	/* http://localhost:9091/ezBears/myBoard/Approval?myBoardNo=0  */

	private static final Logger logger = LoggerFactory.getLogger(SignController.class);
	private final MyBoardListService myBoardListService;
	private final SignService signService;
	private final MemberService memberService;
	private final FileUploadUtil fileUploadUtil;

	@RequestMapping("/Approval")
	public String Approval(@RequestParam (defaultValue = "0") int mBoardNo,  @ModelAttribute SignListSearchVO  signListSearchVo,
			@ModelAttribute MyBoardInfoVO myBoardInfoVo,@ModelAttribute MemberVO memberVo , HttpServletRequest request,HttpSession session,Model model) {


		logger.info("결재 리스트 출력 mBoardNo={} ",mBoardNo);


		String userid = (String)session.getAttribute("userid");
		myBoardInfoVo.setMemId(userid); 
		myBoardInfoVo.setMBoardNo(mBoardNo);

		myBoardInfoVo = myBoardListService.selectBoardInfo(myBoardInfoVo);


		BigDecimal deptNoBigDecimal = (BigDecimal) request.getSession().getAttribute("dept_no");
		int deptNo = deptNoBigDecimal.intValue();

		memberVo.setDeptNo(deptNo);
		memberVo = memberService.selectpositioninfo(deptNo);

		logger.info("memberVo.deptNo={}",memberVo.getDeptNo());

		model.addAttribute("myBoardInfoVo",myBoardInfoVo);
		model.addAttribute("mBoardNo",mBoardNo);
		model.addAttribute("memberVo",memberVo);

		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(signListSearchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT_FIVE);

		signListSearchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT_FIVE);
		signListSearchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		signListSearchVo.setMBoardNo(myBoardInfoVo.getMBoardNo());

		logger.info("결재 부서번호 출력 deptNo={} ",signListSearchVo.getMBoardNo());

		List<Map<String, Object>> list = signService.selectApprovalList(signListSearchVo);

		logger.info("list 사이즈 list={}", list.size());
		int totalCount = signService.selectAppCount(signListSearchVo);
		pagingInfo.setTotalRecord(totalCount);
		logger.info("totalCount={}",totalCount);

		//3
		model.addAttribute("list",list);
		model.addAttribute("mBoardNo",mBoardNo);
		model.addAttribute("pagingInfo",pagingInfo);


		return "myBoard/Approval";
	}

	
	
	@GetMapping("/Approval_write")
	public String Approval_wr(@RequestParam(defaultValue = "0") int mBoardNo,
			@ModelAttribute MyBoardInfoVO myBoardInfoVo, @ModelAttribute MemberVO memberVo , 
			HttpSession session ,Model model) {

		String userid = (String)session.getAttribute("userid");
		logger.info("결재 작성 mBoardNo={},userid={}",mBoardNo,userid);

		myBoardInfoVo.setMemId(userid);	
		myBoardInfoVo.setMBoardNo(mBoardNo);
		logger.info("myBoardInfo 정보={}",myBoardInfoVo);

		myBoardInfoVo = myBoardListService.selectBoardInfo(myBoardInfoVo);
		memberVo = memberService.selectpositioninfo(myBoardInfoVo.getDeptNo());

		model.addAttribute("myBoardInfoVo",myBoardInfoVo);
		model.addAttribute("memberVo",memberVo);

		logger.info("myBoardInfo={}",myBoardInfoVo);


		return "myBoard/Approval_write";
	}

	
	
	@PostMapping("/Approval_write")
	public String Approval_post(@RequestParam(defaultValue = "0") int MBoardNo,
			@ModelAttribute SignVO signVo,@ModelAttribute SignFileVO signFileVo,
			HttpServletRequest request,HttpSession session,
			Model model) {

		logger.info("결재 등록 파라미터 MBoardNo={}, signVo={}",MBoardNo,signVo);
		int cnt = signService.insertApproval(signVo);
		logger.info("결재 등록 파라미터 MBoardNo={}, signVo={}",MBoardNo,signVo);
		logger.info("결재 등록 결과 cnt = {}", cnt);

		String msg = "등록 실패", url="/myBoard/Approval_write";
		try {
			List<Map<String, Object>> files = fileUploadUtil.fileupload(request, ConstUtil.UPLOAD_APPROVAL_FLAG);
			logger.info("업로드파일 정보 files={}", files);
			logger.info("signVo.getDocNo()={}",signVo.getDocNo());

			if(cnt > 0) {
				int fileCnt = signService.insertSignFile(files, signVo.getDocNo());

				msg = "글 작성 성공";
				url = "/myBoard/Approval?mBoardNo="+MBoardNo;
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		// 4.
		return "common/message"; 
	}



	@GetMapping("/Approval_edit")
	public String Approval_edit(@RequestParam (defaultValue = "0")int docNo ,@ModelAttribute MyBoardInfoVO myBoardInfoVo,
			@ModelAttribute MemberVO memberVo, @ModelAttribute SignMemInfoVO signMemInfoVo,HttpSession session ,HttpServletRequest request,	Model model) {
		
		logger.info("결재 수정 페이지");

		signMemInfoVo = signService.selectApprovaMem(docNo);
		logger.info("결재 디테일 signMemInfoVo={}",signMemInfoVo);

		BigDecimal deptNoBigDecimal = (BigDecimal) request.getSession().getAttribute("dept_no");
		int deptNo = deptNoBigDecimal.intValue();

		memberVo.setDeptNo(deptNo);
		memberVo = memberService.selectpositioninfo(deptNo);

		Map<String, Object> list = signService.detailSign(docNo);
		logger.info("결재 디테일 list={}",list);
		model.addAttribute("list",list);

		List<Map<String, Object>> filemap = signService.selectSignnFileInfo(docNo);
		logger.info("결재 파일 정보 filemap={}",filemap);

		model.addAttribute("list",list);
		model.addAttribute("memberVo",memberVo);
		model.addAttribute("filemap",filemap);
		model.addAttribute("signMemInfoVo",signMemInfoVo);

		return "myBoard/Approval_edit";
	}

	
	@PostMapping("/Approval_edit")
	public String Approval_post(@RequestParam(defaultValue = "0") int docNo,
			@RequestParam(defaultValue = "0") int MBoardNo, @ModelAttribute SignFileVO signFileVo,
			@ModelAttribute SignVO signVo, HttpServletRequest request, Model model) {

		logger.info("결재 수정 파라미터 docNo={},signVo={}", docNo, signVo);

		int cnt = signService.updateSignInfo(signVo);
		logger.info("수정 결과 cnt={} , docNo={},signVo.getDocNo={}", cnt, docNo, signVo.getDocNo());

		try {
			String msg = "결재요청 수정 실패";
			String url = "/myBoard/Approval_edit?docNo=" + docNo;

			if (cnt > 0) {

				List<Map<String, Object>> flist = fileUploadUtil.fileupload(request, ConstUtil.UPLOAD_APPROVAL_FLAG);

				if (flist != null && !flist.isEmpty()) {

					signService.deleteSignFile(docNo);
					signService.insertSignFile(flist, docNo);
				}  
				msg = "결재요청 수정 완료";
				url = "/myBoard/Approval_detail?docNo=" + docNo;
			}

			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "common/message";
	}


	@RequestMapping("/Approval_detail")
	public String Approval_detail(@RequestParam (defaultValue = "0")int docNo,
			@RequestParam(defaultValue = "0")int mBoardNo,@RequestParam (defaultValue = "0")int positionNo, @ModelAttribute SignVO signVo,
			@ModelAttribute MyBoardInfoVO myBoardInfoVo,@ModelAttribute MemberVO memberVo , 
			@ModelAttribute SignMemInfoVO signMemInfoVo, HttpServletRequest request,HttpSession session,
			Model model) {

		String userid = (String)session.getAttribute("userid");
		memberVo = memberService.memPositionNoInfo(userid); 

		Map<String, Object> list = signService.detailSign(docNo);
		logger.info("결재 디테일 list={}",list);

		signMemInfoVo = signService.selectApprovaMem(docNo);
		logger.info("결재 디테일 signMemInfoVo={}",signMemInfoVo);


		List<Map<String, Object>> filemap = signService.selectSignnFileInfo(docNo);
		logger.info("결재 파일 정보 filemap={}",filemap);
		logger.info("결재 파일 정보 signMemInfoVo.getMBoardNo()={}",signMemInfoVo.getMBoardNo());


		myBoardInfoVo = myBoardListService.selectMemAppPositionInfo(signMemInfoVo.getMBoardNo());
		logger.info("결재 디테일 myBoardInfoVo={}",myBoardInfoVo);

		model.addAttribute("myBoardInfoVo",myBoardInfoVo); 
		model.addAttribute("signMemInfoVo",signMemInfoVo); 
		model.addAttribute("list",list);
		model.addAttribute("memberVo",memberVo);
		model.addAttribute("filemap",filemap);

		Map<String, Object> userMap = memberService.selectMemberView(userid);
		logger.info("현재 접속한 사람의 정보, userMap={}", userMap);

		model.addAttribute("userMap", userMap);

		return "myBoard/Approval_detail";

	}

	@ResponseBody
	@PostMapping("/statusUpdate")
	public Map<String, Object> statusUpdate(@RequestParam("docNo") int docNo, @RequestParam("positionNo") int positionNo, 
			HttpSession session, Model model) {
		
		Map<String, Object> response = new HashMap<>();

		String userid = (String) session.getAttribute("userid");
		MyBoardInfoVO myBoardInfoVo = new MyBoardInfoVO();
		myBoardInfoVo.setMemId(userid);

		logger.info("결재 문서 번호 docNo={}, positionNo={}", docNo, positionNo);

		if (positionNo == 6) {
			int cnt = signService.updateStatus(docNo);
			if (cnt > 0) {
				response.put("success", true);
			} else {
				response.put("success", false);
				response.put("message", "문서 업데이트에 실패했습니다."); 
			}
		} else {
			response.put("success", false);
			response.put("message", "해당 직책에서는 승인 권한이 없습니다.");
		}

		return response;
	}

	@ResponseBody
	@PostMapping("/statusUpdate2")
	public Map<String, Object> statusUpdate2(@RequestParam("docNo") int docNo, @RequestParam("positionNo") int positionNo, HttpSession session, Model model) {
		Map<String, Object> response = new HashMap<>();

		String userid = (String) session.getAttribute("userid");
		MyBoardInfoVO myBoardInfoVo = new MyBoardInfoVO();
		myBoardInfoVo.setMemId(userid);

		logger.info("결재 문서 번호 docNo={}, positionNo={}", docNo, positionNo);

		if (positionNo == 6) {
			int cnt = signService.updateStatus2(docNo);
			if (cnt > 0) {
				response.put("success", true);
			} else {
				response.put("success", false);
				response.put("message", "문서 업데이트에 실패했습니다."); 
			}
		} else {
			response.put("success", false);
			response.put("message", "해당 직책에서는 승인 권한이 없습니다.");
		}

		return response;
	}

	@GetMapping("/getDocumentStatus")
	@ResponseBody
	public Map<String, Object> getDocumentStatus(@RequestParam("docNo") int docNo) {
		Map<String, Object> response = new HashMap<>();

		String status = signService.selectStatus(docNo);

		logger.info("status={}",status);

		if (status != null) {
			response.put("status", status);
		} else {
			response.put("status", "상태를 가져오지 못했습니다."); // 실패 시 메시지
		}

		return response;

	}

	@RequestMapping("/Filedownload")
	public ModelAndView downloadFile(@RequestParam(defaultValue = "0") int docNo,@RequestParam(defaultValue = "0") int fileNo,
			@RequestParam String fileName,HttpServletRequest request) {

		logger.info("공지사항 파일 다운로드 파라미터 noticeNo={}, fileName={},noticeFileNo={}",docNo, fileName,fileNo);

		Map<String, Object> map = new HashMap<>();

		String upPath = fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_APPROVAL_FLAG);
		File file = new File(upPath, fileName);
		map.put("file", file);

		ModelAndView mav = new ModelAndView("DownloadView", map);
		return mav;
	} 

	@RequestMapping("/Approval_delete")
	public String Approval_delete() {
		logger.info("결재 삭제");
		return "myBoard/Approval_delete";
	}
	
	
	@ResponseBody
	@PostMapping("/deleteAppDoc")
	public Map<String, Object> deleteAppDoc(@RequestParam("docNo") int docNo) {
		Map<String, Object> response = new HashMap<>();

		int cnt = signService.updateStatusSign(docNo);
		
		
		if (cnt > 0) {
			response.put("success", true);
		} else {
			response.put("success", false);
			response.put("message", "문서 삭제를 실패했습니다."); 
		}
		
		return response;
	}
	
	
	
	

}
