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
	
	//업무 게시판 디테일
	Map<String, Object> selectDetail(int teamBoardNo);
	

}
