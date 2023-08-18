
package com.ez.ezBears.myBoard.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MyBoardListDAO {
	List<Map<String, Object>> selectBoardList(String userid);
	String selectByMyBoardName(int myBoardNo);
	
	//부서 이름으로 동적 게시판 번호 찾기
	int findBoardNoByBoardName(String MBoardName);
	
	//내 동적 게시판에 부서 번호로 게시판 등록
	int insertMyBoard(MyBoardListVO myBoardListVo);
}
