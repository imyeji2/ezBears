package com.ez.ezBears.myBoard.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MyBoardDAO {
	int addMyboard(MyBoardVO myBoardVo);
	//메인 보드 번호 찾기
	int selectMainMboardNo(int memNo);
}
