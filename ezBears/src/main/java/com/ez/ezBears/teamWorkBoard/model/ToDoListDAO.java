package com.ez.ezBears.teamWorkBoard.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ToDoListDAO {
	//투두리스트 등록
	int insertTodoList(ToDoListVO todoListVo);
	
	//투두 리스트 검색
	ToDoListVO selectTodoList(int teamBoardNo);
	
	//투두 리스트 수정
	int updateTodoList(ToDoListVO todoListVo);
	
	//투두 리스트 삭제
	int delTodoList(int todolistNo);
	

}
