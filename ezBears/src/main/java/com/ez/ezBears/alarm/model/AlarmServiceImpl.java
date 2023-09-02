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
	public List<AlarmVO> printAllAlarm(String memNum) { // 알림 목록 조회
		List<AlarmVO> aList = alarmDao.selectAllAlarm(sqlSession, memNum);
		return aList;
	}
	
	@Override
	public int modifyAlarm(int alarmNo) { // 알림 읽음 처리
		int result = alarmDao.updateAlarm(sqlSession, alarmNo);
		return result;
	}
	
	@Override
	public int modifyAllAlarm(String memNum) { // 알림 모두 읽음 처리
		int result = alarmDao.updateAllAlarm(sqlSession, memNum);
		return result;
	}
	
	@Override
	public int getListCount(String memNum) { // 알림 카운트
		int count = alarmDao.selectOneList(sqlSession, memNum);
		return count;
	}
	
	@Override
	public int registerAlarm(AlarmVO alarm) { // 알림 등록
		int result = alarmDao.insertAlarm(sqlSession, alarm);
		return result;
	}
	
	// 전자결재
	@Override
	public int printDocNo(String memNum) { // 문서 번호
		int docNo = alarmDao.selectOneDocNo(sqlSession, memNum);
		return docNo;
	}
	
	@Override
	public String printName(int docNo) { // 기안자 이름 조회
		String memName = alarmDao.selectOneName(sqlSession, docNo);
		return memName;
	}

	@Override
	public String printForm(int docNo) { // 양식 이름 조회
		String formName = alarmDao.selectOneForm(sqlSession, docNo);
		return formName;
	}

	@Override
	public String printNum(int docNo) { // 기안자 사원번호 조회
		String memNum = alarmDao.selectOneNum(sqlSession, docNo);
		return memNum;
	}

	@Override
	public String printAppName(String appMemNum) { // 반려자 이름 조회
		String appName = alarmDao.selectOneAppName(sqlSession, appMemNum);
		return appName;
	}

}
