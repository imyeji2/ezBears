package com.ez.ezBears.MBoard.model;

public interface MBoardService {
	//부서에서 동명의 보드가 있는지 찾기
	int checkSameName(String mBoardName);
	// 부서 등록시 자동으로 보드 등록
	int insertMBoard(MBoardVO mBoardVo);
}
