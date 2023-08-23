
package com.ez.ezBears.myBoard.model;

import java.util.List;
import java.util.Map;

public interface MyBoardListService {
	//예지
	//마이보드 메뉴 출력
	List<Map<String, Object>> selectBoardList(String userid);
	
	//마이보드 탭 
	String selectByMyBoardName(MyBoardListVO myBoardListVo);
	
	//마이보드 정보
	MyBoardListVO selectMyBoardInfo(MyBoardListVO myBoardListVo);
	
	//마이보드 이름
	String selectByBoardName(int myBoardNo);
	
	//댓글 동록 마이보드 번호 찾기
	int seleectMyBoardNo(MyBoardListVO myBoardListVo);
	
	
	
	
	//다희
	//부서 이름으로 동적 게시판 번호 찾기
	int findBoardNoByBoardName(String MBoardName);
	
	//내 동적 게시판에 부서 번호로 게시판 등록
	int insertMyBoard(MyBoardListVO myBoardListVo);
	
	//희진
	List<Map<String, Object>> selectBoardInfo(String userid);
}

