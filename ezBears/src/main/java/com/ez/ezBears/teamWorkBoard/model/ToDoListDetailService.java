package com.ez.ezBears.teamWorkBoard.model;

import java.util.List;

public interface ToDoListDetailService {
	//투두리스트 디테일 조회
	List<ToDoListDetailVO> selectToDoListDetail(int toDoListNo);
	
	//투두 리스트 상태 변경
	int updateTodoStatus(ToDoListDetailVO todoListVo);
}
