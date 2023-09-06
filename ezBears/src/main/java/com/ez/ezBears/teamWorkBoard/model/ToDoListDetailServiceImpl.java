package com.ez.ezBears.teamWorkBoard.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

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
	
	
	//투두 리스트 업무 삭제
	@Transactional
	@Override
	public int delTodoDetailService(ToDoListDetailListVO listVo) {
		int cnt=0;
		List<ToDoListDetailVO> list = listVo.getItems();
		
		try {
		
			for(int i=0; i<list.size();i++) {
				ToDoListDetailVO vo = list.get(i);
				cnt = toDoListDetail.delTodoDetail(vo.getTodoDetailNo());
			}
			
		}catch(RuntimeException e) {
			//선언적 트랜젝션(@Transactional)에서는
			//런타임 예외가 발생하면 롤백한다.
			e.printStackTrace();
			cnt=-1;//예외처리를 했다는 의미
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
	}
	
	
	//업무 게시판 삭제 시 전체 디테일 리스트 삭제
	@Override
	public int delTodoDetailByToDoListNo(int todolistNo) {
		return toDoListDetail.delTodoDetailByToDoListNo(todolistNo);
	}
	
	//메인 - 멤버 전체 업무 카운트
	@Override
	public int totalMemberTodolist(int memNo) {
		return toDoListDetail.totalMemberTodolist(memNo);
	}
	
	//메인 - 멤버 완료 업무 카운트
	@Override
	public int completeMemberTodolist(int memNo) {
		return toDoListDetail.completeMemberTodolist(memNo);
	}
	
	//메인 - 멤버 미완료 업무 카운트
	@Override
	public int incompleteMemberTodolist(int memNo) {
		return toDoListDetail.incompleteMemberTodolist(memNo);
	}
	
	

}
