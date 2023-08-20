package com.ez.ezBears.temNotice.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ez.ezBears.common.MyBoardSearchVo;

@Mapper
public interface TeamNoticeDAO {
	//공지사항 등록
	int insertTeamNotice(TeamNoticeVO teamNoticeVo);
	
	//팀별 공지사항 리스트 찾기
	List<Map<String, Object>> selectTeamNoticeList(MyBoardSearchVo searchVo);
	
	//팀별 공지사항 리스트 카운트
	int selectTotalCount(MyBoardSearchVo searchVo);
	
	//팀별 공지사항 디테일
	Map<String, Object> selectDetail(TeamNoticeVO teamNoticeVo);
	
	

}
