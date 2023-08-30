package com.ez.ezBears.teamWorkBoard.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ToDoListDetailServiceImpl implements ToDoListDetailService{
	private final ToDoListDetailDAO toDoListDetail;
	
	@Override
	public List<ToDoListDetailVO> selectToDoListDetail(int toDoListNo) {
		return toDoListDetail.selectToDoListDetail(toDoListNo);
	}
	//투두 리스트 상태 변경
	@Override
	public int updateTodoStatus(ToDoListDetailVO todoListVo) {
		return toDoListDetail.updateTodoStatus(todoListVo);
	}

}
