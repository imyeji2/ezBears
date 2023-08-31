package com.ez.ezBears.teamWorkBoard.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ToDoListDetailServiceImpl implements ToDoListDetailService{
	private final ToDoListDetailDAO toDoListDetail;
	
	@Override
	public List<Map<String, Object>> selectToDoListDetail(int toDoListNo) {
		return toDoListDetail.selectToDoListDetail(toDoListNo);
	}
	//투두 리스트 상태 변경
	@Override
	public int updateTodoStatus(ToDoListDetailVO todoListVo) {
		return toDoListDetail.updateTodoStatus(todoListVo);
	}
	
	//투두 리스트 담당자 변경
	@Override
	public int updateTodoMember(ToDoListDetailVO todoDetailVO) {
		return toDoListDetail.updateTodoMember(todoDetailVO);
	}
	
	//투두 리스트 담당자 삭제
	@Override
	public int delTodoMember(int todoDetailNo) {
		return toDoListDetail.delTodoMember(todoDetailNo);
	}

}
