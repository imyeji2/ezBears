package com.ez.ezBears.teamWorkBoard.model;

import java.util.List;
import java.util.Map;

public interface ToDoListDetailService {
	//투두리스트 디테일 조회
	List<Map<String, Object>> selectToDoListDetail(int toDoListNo);
	
	//투두 리스트 상태 변경
	int updateTodoStatus(ToDoListDetailVO todoListVo);
	
	//투두 리스트 담당자 변경
	int updateTodoMember(ToDoListDetailVO todoDetailVO);
	
	//투두 리스트 담당자 삭제
	int delTodoMember(int todoDetailNo);
	
	//투두 리스트 디테일 삭제
	int delTodoDetailService(ToDoListDetailListVO listVo);
}
