package com.ez.ezBears.teamWorkBoard.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ToDoListDetailDAO {
	
	//투두리스트 디테일 등록
	int insertTodoListDetail(ToDoListDetailVO todoListDetailVo);
	
	//투두리스트 디테일 조회
	List<ToDoListDetailVO> selectToDoListDetail(int toDoListNo);

}
