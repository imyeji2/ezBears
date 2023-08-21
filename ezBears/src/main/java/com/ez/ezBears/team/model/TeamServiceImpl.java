package com.ez.ezBears.team.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

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
	public List<Map<String, Object>> selectAllTeam() {
		return teamDao.selectAllTeam();
	}

	@Override
	public int getTotalRecord() {
		return teamDao.getTotalRecord();
	}
	
}
