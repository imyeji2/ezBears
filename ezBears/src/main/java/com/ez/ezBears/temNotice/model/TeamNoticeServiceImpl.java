package com.ez.ezBears.temNotice.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ez.ezBears.common.MyBoardSearchVo;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TeamNoticeServiceImpl implements TeamNoticeService {
	private final TeamNoticeDAO teamNoticeDao;
	
	//공지사항 등록
	@Override
	public int insertTeamNotice(TeamNoticeVO teamNoticeVo) {
		return teamNoticeDao.insertTeamNotice(teamNoticeVo);
	}
	
	//팀별 공지사항 리스트 찾기
	@Override
	public List<Map<String, Object>> selectTeamNoticeList(MyBoardSearchVo searchVo) {
		return teamNoticeDao.selectTeamNoticeList(searchVo);
	}
	
	//팀별 공지사항 리스트 카운트
	@Override
	public int selectTotalCount(MyBoardSearchVo searchVo) {
		return teamNoticeDao.selectTotalCount(searchVo);
	}

	//팀별 공지사항 디테일
	@Override
	public Map<String, Object> selectDetail(int teamNoticeNo) {
		return teamNoticeDao.selectDetail(teamNoticeNo);
	}
	
	
	//팀별 공지사항 조회수 업데이트 
	@Override
	public int updateViewCount(int teamNoticeNo) {
		return teamNoticeDao.updateViewCount(teamNoticeNo);
	}
	
	
	//팀별 공지사항 업데이트
	@Override
	public int updateTeamNotice(TeamNoticeVO teamNoticeVo) {
		return teamNoticeDao.updateTeamNotice(teamNoticeVo);
	}

	
	//팀별 공지사항 삭제
	@Override
	public int deleteTeamNotice(Map<String, String> map) {
		return teamNoticeDao.deleteTeamNotice(map);
	}

	//팀별 공지사항 번호로 조회
	@Override
	public TeamNoticeVO selectTeamNoticeByNo(int teamNoticeNo) {
		return teamNoticeDao.selectTeamNoticeByNo(teamNoticeNo);
	}
	
	

}
