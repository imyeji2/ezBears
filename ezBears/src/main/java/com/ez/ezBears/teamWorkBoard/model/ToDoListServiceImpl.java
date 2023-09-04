package com.ez.ezBears.teamWorkBoard.model;

import org.springframework.stereotype.Service;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ToDoListServiceImpl implements ToDoListService{
	private final ToDoListDAO toDoListDao;
	
	//투두 리스트 검색
	@Override
	public ToDoListVO selectTodoList(int teamBoardNo) {
		return toDoListDao.selectTodoList(teamBoardNo);
	}

	@Override
	public int delTodoList(int todolistNo) {
		return toDoListDao.delTodoList(todolistNo);
	}

}
