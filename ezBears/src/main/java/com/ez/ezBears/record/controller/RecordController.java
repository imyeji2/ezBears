package com.ez.ezBears.record.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.HttpServerErrorException;

import com.ez.ezBears.common.ConstUtil;
import com.ez.ezBears.common.PaginationInfo;
import com.ez.ezBears.common.SearchVO;
import com.ez.ezBears.record.game.model.GameService;
import com.ez.ezBears.record.game.model.GameVO;
import com.ez.ezBears.record.hitter.model.HitterService;
import com.ez.ezBears.record.hitter.model.HitterVO;
import com.ez.ezBears.record.inning.model.InningService;
import com.ez.ezBears.record.inning.model.InningVO;
import com.ez.ezBears.record.pitcher.model.PitcherService;
import com.ez.ezBears.record.pitcher.model.PitcherVO;
import com.ez.ezBears.team.model.TeamService;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;


@Controller
@RequestMapping("/record")
@RequiredArgsConstructor
public class RecordController {
	private static final Logger logger = LoggerFactory.getLogger(RecordController.class);

	private final GameService gameService;
	private final TeamService teamService;
	private final HitterService hitterService;
	private final PitcherService pitcherService;
	private final InningService inningService;
	
	@GetMapping("/gameRecordDetail")
	public String gameRecordDetail_get(@RequestParam(defaultValue = "0") int recodeNo, Model model) {
		logger.info("경기 기록 상세 페이지 이동 파라미터, recodeNo={}", recodeNo);
		
		GameVO gameVo = gameService.selectByRecodeNo(recodeNo);
		logger.info("경기 기록 상세 페이지 조회, 결과 gameVo={} ", gameVo);
		
		model.addAttribute("gameVo", gameVo);
		
		return "/record/gameRecordDetail";
	}
	
	
	@RequestMapping("/team")
	public String team() {
		//1,4
		logger.info("팀 기록 보여주기");
		return "/record/team";
	}
	
	
	@GetMapping("/inningWrite")
	public String inningWrite_get(Model model, int recodeNo) {
		logger.info("이닝정보등록 페이지 이동 recodeNo={}", recodeNo);
		
		List<Map<String, Object>> list = inningService.selectInningView(recodeNo);
		model.addAttribute("list", list);
		logger.info("list.size={}", list.size());
		
		return "/record/inningWrite";
	}
	
	@PostMapping("/inningWrite")
	public String inningWrite_post(@ModelAttribute InningVO inningVo) {
		
		int cnt = inningService.insertInning(inningVo);
		
		logger.info("이닝정보등록");
		return "/record/gameRecordDetail2";
	}
	
	
	@RequestMapping("/inningEdit")
	public String inningUpdate() {
		//1,4
		logger.info("이닝정보수정");
		return "/record/inningEdit";
	}
	
	@RequestMapping("/inningDelete")
	public String inningDelete() {
		//1,4
		logger.info("이닝정보수정");
		return "/record/inningDelete";
	}
	
	@RequestMapping("/summary")
	public String inningDetail_get(Model model, int recodeNo) {
		logger.info("이닝 파라미터, recodeDetailNo={}", recodeNo);
		
		List<Map<String, Object>> list = inningService.selectInningView(recodeNo);
		model.addAttribute("list", list);
		logger.info("이닝 처리 결과, list.size={}", list.size());
		return "/record/summary";
	}
	
	@RequestMapping("/gameRecordDetail2")
	public String gameRecordDetail2_get(Model model, int recodeNo) {
		logger.info("경기별 이닝 기록 파라미터, recodeNo={}", recodeNo);
		
		List<Map <String, Object>> list = inningService.selectInningView(recodeNo);
		Map <String, Object> map1 = inningService.selectInningHomeView(recodeNo);
		Map <String, Object> map2 = inningService.selectInningAwayView(recodeNo);
		model.addAttribute("list", list);
		model.addAttribute(map1);
		model.addAttribute(map2);
		logger.info("이닝 처리 결과, list.size={}", list.size());
		logger.info("map1", map1);
		logger.info("map2", map2);
		
		return "/record/gameRecordDetail2";
	}
	
	
	@RequestMapping("/lineup")
	public String lineup_get(Model model, int recodeNo) {
		logger.info("라인업 파라미터, recodeNo={}", recodeNo);
		
		List<Map<String, Object>> list = hitterService.selectHitterRecordView(recodeNo);
		model.addAttribute("list", list);
		logger.info("라인업 처리 결과, list.size={}", list.size());
		
		List<Map<String, Object>> list2 = pitcherService.selectPitcherRecordView(recodeNo);
		model.addAttribute("list2", list2);
		logger.info("라인업 처리 결과2, list.size={}", list2.size());
		
		
		return "/record/lineup";
	}
	
	
//	@GetMapping("/summary")
//	public String summary_get(@RequestParam(defaultValue = "0") int recodeDetailNo, SearchVO searchVo, Model model) {
//		logger.info("경기 개요 파라미터 recodeDetailNo = {}", recodeDetailNo);
//		
//		List<InningVO> list = inningService.selectByrecodeDetailNo(searchVo, recodeDetailNo);
//		model.addAttribute("list", list);
//		return "/record/summary";
//	}
	
	@GetMapping("/hitterRecordWrite")
	public String hitterRecordWrite_get(Model model, int playerNo) {
		logger.info("타자기록입력");
		
		List<Map<String, Object>> map = hitterService.selectHitterView(playerNo);
		
		model.addAttribute("map", map);
		
		return "/record/hitterRecordWrite";
	}
	
	@PostMapping("/hitterRecordWrite")
	public String hitterRecordWrite_post(@ModelAttribute HitterVO hitterVo, HttpServletRequest request,
			Model model) {
		//1,4
		logger.info("타자기록입력");
		
		int cnt = hitterService.insertHitter(hitterVo);
		
		return "redirect:/record/hitterRecordDetail?playerNo="+hitterVo.getPlayerNo();
	}
	
	
	@GetMapping("/hitterRecordEdit")
	public String hitterRecordEdit_get(Model model, int playerNo) {
		logger.info("타자기록수정 파라미터 playerNo={}");
		
		List<Map<String, Object>> list = hitterService.selectHitterView(playerNo);
		
		model.addAttribute("list", list);
		
		return "/record/hitterRecordEdit";
	}
	
	
	@PostMapping("/hitterRecordEdit")
	public String hitterRecordEdit_post(Model model, HitterVO hitterVo) {
		logger.info("타자기록수정");
		
		int cnt = hitterService.updateHitter(hitterVo);
		
		
		
		return "/record/hitterRecordEdit";
	}
	
	
	@RequestMapping("/hitterRecordDelete")
	public String hitterRecordDelete() {
		//1,4
		logger.info("타자기록삭제");
		return "/record/hitterRecordDelete";
	}
	
	@GetMapping("/hitterRecordDetail")
	public String hitterRecordDetail_get(@RequestParam(defaultValue = "0") int playerNo, Model model) {
		
		logger.info("타자기록정보 화면 이동, 파라미터 playerNo = {}", playerNo);
		List<Map<String, Object>> list = hitterService.selectHitterView(playerNo);
		
		model.addAttribute("list", list);
		
		return "/record/hitterRecordDetail";
	}
	
	@GetMapping("/hitterStat")
	public String hitterStat_get(@RequestParam(defaultValue = "0") int playerNo, Model model) {
		
		Map<String, Object> map = hitterService.selectHitterStatView(playerNo);
		model.addAttribute("map", map);
		
		return "/record/hitterStat";
	}
	
	@GetMapping("/pitcherRecordWrite")
	public String pitcherRecordWrite_get(Model model, int playerNo) {
		logger.info("투수 기록 등록 화면 이동");
		
		List<Map<String, Object>> list = pitcherService.selectPitcherView(playerNo);
		model.addAttribute("list", list);
		
		return "/record/pitcherRecordWrite";
	}
	
	
	@PostMapping("/pitcherRecordWrite")
	public String pitcherRecordWrite_post(@ModelAttribute PitcherVO pitcherVo, int playerNo) {
		//1,4
		logger.info("투수 기록 등록 처리 파라미터 PitcherVo={}", pitcherVo);
		
		int cnt = pitcherService.insertPitcher(pitcherVo);
		logger.info("투수 기록 등록 처리 결과, cnt={}", cnt);
		
		return "redirect:/record/pitcherRecordDetail?playerNo="+pitcherVo.getPlayerNo();
	}
	
	@GetMapping("/pitcherRecordEdit")
	public String pitcherRecordEdit_get() {
		//1,4
		logger.info("투수기록수정");
		return "/record/pitcherRecordEdit";
	}
	
	@PostMapping("/pitcherRecordEdit")
	public String pitcherRecordEdit_post() {
		//1,4
		logger.info("투수기록수정");
		return "/record/pitcherRecordEdit";
	}
	
	@GetMapping("/pitcherRecordDelete")
	public String pitcherRecordDelete_get(@RequestParam(defaultValue = "0") int recodeNo, Model model) {
		logger.info("투수기록삭제, 파라미터 recodeNo = {}", recodeNo);
		
		PitcherVO pitcherVo = pitcherService.selectPitcherByPlayerNo(recodeNo);
		logger.info("경기 삭제 화면 이동, 파라미터 gameVo={}", pitcherVo);
		
		model.addAttribute("pitcherVo", pitcherVo);
		
		
		return "/record/pitcherRecordDelete";
	}
	
	@PostMapping("/pitcherRecordDelete")
	public String pitcherRecordDelete_post() {
		//1,4
		logger.info("투수기록삭제");
		return "/record/pitcherRecordDelete";
	}
	
	@GetMapping("/pitcherRecordDetail")
	public String pitcherRecordDetail_get(@RequestParam(defaultValue = "0") int playerNo, SearchVO searchVo, Model model) {
		logger.info("투수 기록 정보 화면 이동, 파라미터 playerNo = {}", playerNo);
		
		//pagination 객체 생성하고 변수 없는 애들 선언해주기
		PaginationInfo pagination = new PaginationInfo();
		pagination.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagination.setCurrentPage(searchVo.getCurrentPage());
		pagination.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		//searchVo 에 비어있는 변수 선언하기
		searchVo.setFirstRecordIndex(pagination.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(pagination.getRecordCountPerPage());
		logger.info("설정 후 searchVo={}", searchVo);
		
		int totalRecord = teamService.getTotalRecord(searchVo);
		pagination.setTotalRecord(totalRecord);
		logger.info("pagination 설정 완");
		
		
		List<Map<String, Object>> list = pitcherService.selectPitcherView(playerNo);
		logger.info("list.size={}", list.size());
		
		model.addAttribute("pagination",pagination);
		model.addAttribute("list", list);
		
		return "/record/pitcherRecordDetail";
	}
	

    @RequestMapping("/gameList")
    public String gameList(@ModelAttribute SearchVO searchVo, Model model) {
        logger.info("경기정보, 파라미터 searchVo={}", searchVo);
            
        List<GameVO> list = gameService.selectAllGame(searchVo);
        logger.info("경기 전체 조회결과, list.size={}", list.size());
        
        model.addAttribute("list", list);

        return "record/gameList"; 
    }

    @GetMapping("/gameWrite")
    public String gameWrite_get(Model model, SearchVO searchVo) {
        logger.info("경기 등록 화면 이동");
        
        List<GameVO> gameWrite = gameService.selectAllGame(searchVo);
        
        model.addAttribute("list", gameWrite);

        return "record/gameWrite";
    }
    
    @PostMapping("/gameWrite")
    public String gameWrite_post(@ModelAttribute GameVO gameVo) {
        logger.info("경기 등록 처리 파라미터, gameVo={}", gameVo);

       int cnt = gameService.insertGame(gameVo);
       logger.info("게임 등록 처리 결과, cnt={}", cnt);
        
        return "redirect:/record/gameList";
    }

	
	@GetMapping("/gameEdit")
	public String gameUpdate_get(@RequestParam int recodeNo, Model model, SearchVO searchVo) {
		logger.info("경기 정보 수정 화면 이동, 파라미터 recodeNo={}", recodeNo);
		
		if(recodeNo == 0) {
			model.addAttribute("msg", "잘못된 URL입니다");
			model.addAttribute("url", "/record/gameList");
			return "common/message";
		}
		
	GameVO gameVo = gameService.selectByRecodeNo((recodeNo));
	logger.info("경기 수정 화면 이동 결과, gameVo={}", gameVo);
	List<GameVO> gameEdit = gameService.selectAllGame(searchVo);
	
	model.addAttribute("gameVo", gameVo);
	model.addAttribute("gameEdit", gameEdit);
	
	return "/record/gameEdit";
	}
	
	
	@PostMapping("/gameEdit")
	public String gameUpdate_post(@ModelAttribute GameVO gameVo, HttpServletRequest rquest, Model model) {
		//1,4
		logger.info("경기 수정 처리, 파라미터 gameVo={}", gameVo);
		
		int cnt = gameService.updateGame(gameVo);
		logger.info("경기 수정 처리 결과, cnt={}", cnt);
		
		return "redirect:/record/gameRecordDetail?recodeNo="+gameVo.getRecodeNo();
	}
	
	
	@GetMapping("/gameDelete")
	public String gameDelete_get(@RequestParam(defaultValue = "0") int recodeNo, Model model) {
		logger.info("경기 삭제 화면 이동, 파라미터 recodeNo={}", recodeNo);
		
		GameVO gameVo = gameService.selectByRecodeNo(recodeNo);
		logger.info("경기 삭제 화면 이동, 파라미터 gameVo={}", gameVo);
		
		model.addAttribute("gameVo", gameVo);
		
		return "/record/gameDelete";
	}
	
	@PostMapping("/gameDelete")
	public String gameDelete_post(@RequestParam(defaultValue = "0") int recodeNo, Model model) {
		logger.info("경기 삭제 처리 , 파라미터 recodeNo={}", recodeNo);
		
		int cnt = gameService.deleteGame(recodeNo);
		logger.info("경기 삭제 처리 결과, 파라미터 cnt={}", cnt);
		
		return "redirect:/record/gameList";
	}
	
	@RequestMapping("/teamList")
	public String List_get(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("선수 목록 화면 이동, 파라미터 searchVo={}", searchVo);
		
		//pagination 객체 생성하고 변수 없는 애들 선언해주기
		PaginationInfo pagination = new PaginationInfo();
		pagination.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagination.setCurrentPage(searchVo.getCurrentPage());
		pagination.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		//searchVo 에 비어있는 변수 선언하기
		searchVo.setFirstRecordIndex(pagination.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(pagination.getRecordCountPerPage());
		logger.info("설정 후 searchVo={}", searchVo);
		
		int totalRecord = teamService.getTotalRecord(searchVo);
		pagination.setTotalRecord(totalRecord);
		logger.info("pagination 설정 완");
		
		List<Map<String, Object>> list = teamService.selectAllTeam(searchVo);
		logger.info("선수 목록 화면 처리 결과, list.size()={}", list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("pagination", pagination);
		
		return "/record/teamList";
	}
	
	
	@RequestMapping("/teamList2")
	public String List_get2(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("선수 목록 화면 이동, 파라미터 searchVo={}", searchVo);
		
		//pagination 객체 생성하고 변수 없는 애들 선언해주기
		PaginationInfo pagination = new PaginationInfo();
		pagination.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagination.setCurrentPage(searchVo.getCurrentPage());
		pagination.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		//searchVo 에 비어있는 변수 선언하기
		searchVo.setFirstRecordIndex(pagination.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(pagination.getRecordCountPerPage());
		logger.info("설정 후 searchVo={}", searchVo);
		
		int totalRecord = teamService.getTotalRecord(searchVo);
		pagination.setTotalRecord(totalRecord);
		logger.info("pagination 설정 완");
		
		List<Map<String, Object>> list = teamService.selectAllTeam(searchVo);
		logger.info("선수 목록 화면 처리 결과, list.size()={}", list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("pagination", pagination);
		
		return "/record/teamList2";
	}

}