package com.ez.ezBears.teamWorkBoard.model;

import com.ez.ezBears.temNotice.model.TeamNoticeVO;

public interface TeamWorkBoardService {
	
	//팀별 업무 게시판 등록 서비스
	int teamWorkBoardInsert(TeamNoticeVO teamVo, ToDoListVO todoList, 
			ToDoListDetailListVO listVo);
}
