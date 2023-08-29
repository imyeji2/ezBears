package com.ez.ezBears.teamWorkBoard.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.ez.ezBears.common.MyBoardSearchVo;

import lombok.RequiredArgsConstructor;


//팀별 업무 게시판 등록
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
			//팀별 업무 게시판 등록
			cnt = teamWorkBoardDao.insertTeamWorkBoard(teamVo);
			int teamBoardNo = teamVo.getTeamBoardNo();//업무게시판 번호 
			todoList.setTeamBoardNo(teamBoardNo);//투두리스트에 업무 게시판 번호

			//투두리스트 등록
			cnt = todoListDao.insertTodoList(todoList);
			
			int toDoListNo = todoList.getTodolistNo();//투두리스트 번호
			
			List<ToDoListDetailVO> list = listVo.getItems();
			
			for(int i=0;i<list.size();i++) {
				ToDoListDetailVO vo = list.get(i);
				vo.setTodolistNo(toDoListNo);
				cnt = todoListDetailDao.insertTodoListDetail(vo);
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

	//팀별 업무 게시판 리스트
	@Override
	public List<Map<String, Object>> selectTeamWorkBoard(MyBoardSearchVo myBoardSearchVo){
		return teamWorkBoardDao.selectTeamWorkBoard(myBoardSearchVo);
	}

	//팀별 업무 게시판 리스트 전체 레코드
	@Override
	public int selectTotalCount(MyBoardSearchVo myBoardSearchVo) {
		return teamWorkBoardDao.selectTotalCount(myBoardSearchVo);
	}
	
	
	

	
	

}
