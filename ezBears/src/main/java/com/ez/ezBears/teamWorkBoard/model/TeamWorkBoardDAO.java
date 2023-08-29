package com.ez.ezBears.teamWorkBoard.model;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ez.ezBears.common.MyBoardSearchVo;

@Mapper
public interface TeamWorkBoardDAO {
	//팀 업무 게시판 등록
	int insertTeamWorkBoard(TeamWorkBoardVO teamWorkVo);
	
	//팀 업무 게시판 리스트
	List<Map<String, Object>> selectTeamWorkBoard(MyBoardSearchVo myBoardSearchVo);
	
	int selectTotalCount(MyBoardSearchVo myBoardSearchVo);
	


}
