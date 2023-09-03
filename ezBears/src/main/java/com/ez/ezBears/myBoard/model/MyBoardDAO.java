package com.ez.ezBears.myBoard.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MyBoardDAO {
	int addMyboard(MyBoardVO myBoardVo);
}
