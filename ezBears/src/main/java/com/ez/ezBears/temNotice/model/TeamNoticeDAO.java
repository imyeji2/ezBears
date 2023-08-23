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
	Map<String, Object> selectDetail(int teamNoticeNo);
	
	//팀별 공지사항 조회수 업데이트 
	int updateViewCount(int teamNoticeNo);
	
	//팀별 공지사항 업데이트
	int updateTeamNotice(TeamNoticeVO teamNoticeVo);
	
	//팀별 공지사항 삭제
	int deleteTeamNotice(Map<String, String> map);
	
	//팀별 공지사항 번호로 조회
	TeamNoticeVO selectTeamNoticeByNo(int teamNoticeNo);
	
	//팀별 공지사항 댓글 등록
	int insertReply(TeamNoticeVO teamNoticeVo);
	int updateSortNo(TeamNoticeVO teamNoticeVo);
	
	//팀별 공지사항 댓글 검색
	List<Map<String, Object>> selectReply(int groupNo);
	


}
