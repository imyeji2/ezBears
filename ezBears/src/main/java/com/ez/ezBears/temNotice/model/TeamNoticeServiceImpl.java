package com.ez.ezBears.temNotice.model;

import java.util.List;
import java.util.Map;

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

	@Override
	public List<Map<String, Object>> selectTeamNoticeList(int myBoardNo) {
		return teamNoticeDao.selectTeamNoticeList(myBoardNo);
	}

}
