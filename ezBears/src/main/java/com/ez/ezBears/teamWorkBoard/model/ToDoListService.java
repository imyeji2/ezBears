package com.ez.ezBears.teamWorkBoard.model;

public interface ToDoListService {
	
	//투두 리스트 검색
	ToDoListVO selectTodoList(int teamBoardNo);
	
	//투두 리스트 삭제
	int delTodoList(int todolistNo);
	
}
