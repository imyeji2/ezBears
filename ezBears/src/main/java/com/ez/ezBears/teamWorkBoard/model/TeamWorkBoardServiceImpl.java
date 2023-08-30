package com.ez.ezBears.teamWorkBoard.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.ez.ezBears.common.MyBoardSearchVo;
import com.ez.ezBears.temNotice.model.TeamNoticeVO;

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
	
	
	//팀 업무 게시판 조회수
	@Override
	public int updateViewCount(int teamBoardNo) {
		return teamWorkBoardDao.updateViewCount(teamBoardNo);
	}

	//업무 게시판 디테일
	@Override
	public Map<String, Object> selectDetail(int teamBoardNo) {
		return teamWorkBoardDao.selectDetail(teamBoardNo);
	}
	
	//댓글 조회
	@Override
	public List<Map<String, Object>> selectReply(MyBoardSearchVo searchVo) {
		return teamWorkBoardDao.selectReply(searchVo);
	}
	
	//댓글 전체 카운트
	@Override
	public int selectReplyTotalCount(int groupNo) {
		return teamWorkBoardDao.selectReplyTotalCount(groupNo);
	}
	
	//댓글 등록
	@Override
	@Transactional
	public int addreply(TeamWorkBoardVO teamWorkBoardVo) {
		int cnt=teamWorkBoardDao.updateSortNo(teamWorkBoardVo);
		teamWorkBoardVo.setGroupNo(teamWorkBoardDao.selectGroupNo());
		cnt = teamWorkBoardDao.insertReply(teamWorkBoardVo);
		return cnt;
	}


	
}
