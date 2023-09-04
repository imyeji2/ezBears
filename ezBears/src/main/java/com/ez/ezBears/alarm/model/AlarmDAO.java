package com.ez.ezBears.alarm.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;

@Mapper
public interface AlarmDAO {
	List<AlarmVO> selectAllAlarm(SqlSession sqlSession, int memNo); // 알림 목록 조회
	int updateAlarm(SqlSession sqlSession, int alarmNo); // 알림 읽음 처리
	int updateAllAlarm(SqlSession sqlSession, int memNo); // 알림 모두 읽음 처리
	int selectOneList(SqlSession sqlSession, int memNo); // 알림 카운트
	int insertAlarm(SqlSession sqlSession, AlarmVO alarm); // 알림 등록회
}
