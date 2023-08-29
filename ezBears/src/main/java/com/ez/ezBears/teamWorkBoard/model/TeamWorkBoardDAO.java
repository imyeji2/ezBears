package com.ez.ezBears.teamWorkBoard.model;
import org.apache.ibatis.annotations.Mapper;

import com.ez.ezBears.temNotice.model.TeamNoticeVO;

@Mapper
public interface TeamWorkBoardDAO {
	//팀 업무 게시판 등록
	int insertTeamWorkBoard(TeamWorkBoardVO teamWorkVo);
	


}
