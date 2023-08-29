package com.ez.ezBears.teamWorkBoard.model;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TeamWorkBoardServiceImpl implements TeamWorkBoardService{
	private final TeamWorkBoardDAO teamWorkBoardDao;
	private final ToDoListDAO todoListDao;
	private final ToDoListDetailDAO todoListDetailDao;

	@Override
	@Transactional
	public int teamWorkBoardInsert(TeamWorkBoardVO teamVo, ToDoListVO todoList, 
			ToDoListDetailListVO listVo) {
		int cnt=0;

		try {
			cnt = teamWorkBoardDao.insertTeamWorkBoard(teamVo);
			System.out.println("1.teamVo:"+teamVo);
			int teamBoardNo = teamVo.getTeamBoardNo();
			System.out.println("1.teamBoardNo:"+teamBoardNo);
			
			
			todoList.setTeamBoardNo(teamBoardNo);
			
			cnt = todoListDao.insertTodoList(todoList);
			System.out.println("2.todoList:"+todoList+",cnt="+cnt);
			
			int toDoListNo = todoList.getTodolistNo();
			System.out.println("2.toDoListNo:"+toDoListNo);
			
			List<ToDoListDetailVO> list = listVo.getItems();
			
			for(int i=0;i<list.size();i++) {
				ToDoListDetailVO vo = list.get(i);
				System.out.println("2:"+todoList);
				vo.setTodolistNo(toDoListNo);
				
				cnt = todoListDetailDao.insertTodoListDetail(vo);
				System.out.println("listVo:"+listVo);
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
	

}
