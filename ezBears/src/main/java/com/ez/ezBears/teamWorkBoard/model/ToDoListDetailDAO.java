package com.ez.ezBears.teamWorkBoard.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ToDoListDetailDAO {
	
	//투두리스트 디테일 등록
	int insertTodoListDetail(ToDoListDetailListVO todoListDetailList);

}
