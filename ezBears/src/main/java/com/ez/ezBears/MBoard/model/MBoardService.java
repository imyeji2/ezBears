package com.ez.ezBears.MBoard.model;

import java.util.List;

import com.ez.ezBears.common.SearchVO;

public interface MBoardService {
	//부서에서 동명의 보드가 있는지 찾기
	int checkSameName(String mBoardName);
	// 부서 등록시 자동으로 보드 등록
	int insertMBoard(MBoardVO mBoardVo);
	
	//전체 게시판 가지고오기
	List<MBoardVO> selectAllboard(SearchVO searchVo);
	
	//전체 게시판 개수
	int totalBoardList(SearchVO searchVo);
	
	//예지
	int addBoard(MBoardVO mBoardVo);
}
