package com.ez.ezBears.alarm.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import lombok.RequiredArgsConstructor;

import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AlarmServiceImpl implements AlarmService {
	
	private final AlarmDAO alarmDao;
	private final SqlSession sqlSession;
	@Override
	public List<AlarmVO> selectAllAlarm(SqlSession sqlSession, int memNo) {
		// TODO Auto-generated method stub
		return alarmDao.selectAllAlarm(sqlSession, memNo);
	}
	@Override
	public int updateAlarm(SqlSession sqlSession, int alarmNo) {
		// TODO Auto-generated method stub
		return alarmDao.updateAlarm(sqlSession, alarmNo);
	}
	@Override
	public int updateAllAlarm(SqlSession sqlSession, int memNo) {
		// TODO Auto-generated method stub
		return alarmDao.updateAllAlarm(sqlSession, memNo);
	}
	@Override
	public int selectOneList(SqlSession sqlSession, int memNo) {
		// TODO Auto-generated method stub
		return alarmDao.selectOneList(sqlSession, memNo);
	}
	@Override
	public int insertAlarm(SqlSession sqlSession, AlarmVO alarm) {
		// TODO Auto-generated method stub
		return alarmDao.insertAlarm(sqlSession, alarm);
	}


	

}
