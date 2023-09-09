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
			cnt=-1;//예외처리를 했다는 의미->예외 발생
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
	
	//팀별 업무게시판 삭제
	@Override
	public int deleteTeamWorkBoard(Map<String, String> map) {
		return teamWorkBoardDao.deleteTeamWorkBoard(map);
	}	
	
	//팀별 업무게시판 번호로 조회
	@Override
	public TeamWorkBoardVO selectTeamWorkBoardByNo(int teamBoardNo) {
		return teamWorkBoardDao.selectTeamWorkBoardByNo(teamBoardNo);
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

	///팀 업무 게시판 댓글 업데이트
	@Override
	public int updeteReply(TeamWorkBoardVO teamWorkBoardVo) {
		return teamWorkBoardDao.updeteReply(teamWorkBoardVo);
	}

	//대댓글 등록
	@Override
	public int addReReply(TeamWorkBoardVO teamWorkBoardVo) {
		int cnt=teamWorkBoardDao.updateSortNo(teamWorkBoardVo);
		cnt = teamWorkBoardDao.insertReReply(teamWorkBoardVo);
		return cnt;
	}


	//업무 게시판 수정
	@Transactional
	@Override
	public int updateBoard(TeamWorkBoardVO teamVo, ToDoListVO todoList, ToDoListDetailListVO listVo) {
		int teamBoardNo = teamVo.getTeamBoardNo();
		int todolistNo=todoList.getTodolistNo();
		int cnt=0;
		
		try {
			
			List<ToDoListDetailVO> list = listVo.getItems();
			for(int i=0;i<list.size();i++) {
				ToDoListDetailVO vo = list.get(i);
				if(vo.getTodoDetailNo()==0) {
					vo.setTodolistNo(todolistNo);
					System.out.println("vo="+vo);
					System.out.println("집중!"+vo.getTodoDetailNo());
					cnt=todoListDetailDao.insertTodoListDetail(vo);
					System.out.println("추가 등록 결과 cnt={}"+cnt);
				}else{
					cnt = todoListDetailDao.updateTodoDetail(vo);
					System.out.println("업데이트 결과 cnt={}"+cnt);
				}
			}
				
			cnt = todoListDao.updateTodoList(todoList);
			cnt = teamWorkBoardDao.updateTeamWorkBoard(teamVo);
			
		}catch(RuntimeException e) {
			//선언적 트랜젝션(@Transactional)에서는
			//런타임 예외가 발생하면 롤백한다.
			e.printStackTrace();
			cnt=-1;//예외처리를 했다는 의미
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
	
		return cnt;
	}

	@Override
	@Transactional
	public int deleteBoard(Map<String, String> map, int todolistNo) {
		int cnt=0;
		
		try {
			cnt = todoListDetailDao.delTodoDetailByToDoListNo(todolistNo);
			System.out.println("업무 디테일 삭제 결과 cnt="+cnt);
			
			cnt = todoListDao.delTodoList(todolistNo);
			System.out.println("투두리스트 삭제 결과 cnt="+cnt);

			cnt = teamWorkBoardDao.deleteTeamWorkBoard(map);
			System.out.println("업무 게시판 삭제 결과 cnt="+cnt);
			
		}catch (RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			System.out.println("예외발생");
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
	}

	@Override
	public int deleteFile(int teamBoardNo) {
		return teamWorkBoardDao.deleteFile(teamBoardNo);
	}

	//이전글 다음글
	@Override
	public Map<String, Object> selectTeamWorkBoardNext(Map<String, Integer> nextMap) {
		return teamWorkBoardDao.selectTeamWorkBoardNext(nextMap);
	}


	
}
