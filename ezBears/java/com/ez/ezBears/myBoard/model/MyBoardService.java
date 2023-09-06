package com.ez.ezBears.myBoard.model;


public interface MyBoardService {
	//메인 보드 번호 찾기
	int selectMainMboardNo(int memNo);
	
	//마이보드 멤버 삭제
	int deleteMyBoardMember(MyBoardVO myBoardVo);
}
