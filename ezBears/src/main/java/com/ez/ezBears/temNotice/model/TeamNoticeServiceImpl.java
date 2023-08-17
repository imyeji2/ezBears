package com.ez.ezBears.temNotice.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TeamNoticeServiceImpl implements TeamNoticeService {
	private final TeamNoticeDAO teamNoticeDao;

	@Override
	public int insertTeamNotice(TeamNoticeVO teamNoticeVo) {
		return teamNoticeDao.insertTeamNotice(teamNoticeVo);
	}

}
