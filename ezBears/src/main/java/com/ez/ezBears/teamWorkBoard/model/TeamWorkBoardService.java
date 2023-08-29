package com.ez.ezBears.teamWorkBoard.model;

import java.util.List;
import java.util.Map;

import com.ez.ezBears.common.MyBoardSearchVo;

public interface TeamWorkBoardService {

	//팀별 업무 게시판 등록 서비스
	int teamWorkBoardInsert(TeamWorkBoardVO teamVo, ToDoListVO todoList, 
			ToDoListDetailListVO listVo);
	
	//팀 업무 게시판 리스트
	List<Map<String, Object>> selectTeamWorkBoard(MyBoardSearchVo myBoardSearchVo);
	
	//팀 업무 게시판 전체 카운트
	int selectTotalCount(MyBoardSearchVo myBoardSearchVo);
}
