package com.ez.ezBears.teamWorkBoard.model;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ez.ezBears.common.MyBoardSearchVo;
import com.ez.ezBears.temNotice.model.TeamNoticeVO;

@Mapper
public interface TeamWorkBoardDAO {
	//팀 업무 게시판 등록
	int insertTeamWorkBoard(TeamWorkBoardVO teamWorkVo);
	
	//팀 업무 게시판 리스트
	List<Map<String, Object>> selectTeamWorkBoard(MyBoardSearchVo myBoardSearchVo);
	
	//팀 업무 게시판 전체 레코드
	int selectTotalCount(MyBoardSearchVo myBoardSearchVo);
	
	//팀 업무 게시판 조회수
	int updateViewCount(int teamBoardNo);
	
	//팀 업무 게시판 삭제
	int deleteTeamWorkBoard(Map<String, String> map);
	
	//팀 업무 게시판 번호로 조회
	TeamWorkBoardVO selectTeamWorkBoardByNo(int teamBoardNo);
	
	//업무 게시판 디테일
	Map<String, Object> selectDetail(int teamBoardNo);

	//댓글 검색
	List<Map<String, Object>> selectReply(MyBoardSearchVo searchVo);

	//댓글 전체 카운트
	int selectReplyTotalCount(int groupNo);
	
	//댓글 등록
	int insertReply(TeamWorkBoardVO teamWorkBoardVo);
	int updateSortNo(TeamWorkBoardVO teamWorkBoardVo);

	//팀 업무 게시판 그룹 시퀀스 
	int selectGroupNo();
	
	//팀 업무 게시판 댓글 업데이트
	int updeteReply(TeamWorkBoardVO teamWorkBoardVo);
	
	//팀 업무 게시판 대댓글 등록
	int insertReReply(TeamWorkBoardVO teamWorkBoardVo);
	
	//팀 업무 게시판 수정
	int updateTeamWorkBoard(TeamWorkBoardVO teamWorkBoardVo);
	
	//파일 삭제
	int deleteFile(int teamBoardNo);
	
	//이전글/다음글
	Map<String, Object> selectTeamWorkBoardNext(Map<String, Integer> nextMap);


	
	
}
