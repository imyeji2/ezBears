package com.ez.ezBears.team.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ez.ezBears.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TeamServiceImpl implements TeamService{
	public final TeamDAO teamDao;

	@Override
	public int insertTeam(TeamVO teamVo) {
		return teamDao.insertTeam(teamVo);
	}

	@Override
	public List<Map<String, Object>> selectAllTeam(SearchVO searchVo) {
		return teamDao.selectAllTeam(searchVo);
	}

	@Override
	public int getTotalRecord(SearchVO searchVo) {
		return teamDao.getTotalRecord(searchVo);
	}

	@Override
	public Map<String, Object> selectByPlayerNo(int playerNo) {
		return teamDao.selectByPlayerNo(playerNo);
	}

	@Override
	public int updateTeam(TeamVO teamVo) {
		return teamDao.updateTeam(teamVo);
	}

	@Override
	public int deleteTeam(int playerNo) {
		return teamDao.deleteTeam(playerNo);
	}
	
}
