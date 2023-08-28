package com.ez.ezBears.teamWorkBoard.model;

import org.springframework.stereotype.Service;

import com.ez.ezBears.temNotice.model.TeamNoticeVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TeamWorkBoardServiceImpl implements TeamWorkBoardService{
	private final TeamWorkBoardDAO teamWorkBoardDao;
	private final ToDoListDAO todoListDao;
	private final ToDoListDetailDAO todoListDetailDao;

	@Override
	public int teamWorkBoardInsert(TeamNoticeVO teamVo, ToDoListVO todoList, ToDoListDetailListVO listVo) {

		int cnt = 0;
		return cnt;
	}
	

}
