package com.ez.ezBears.alarm.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;

@Mapper
public interface AlarmDAO {
	List<AlarmVO> selectAllAlarm(SqlSession sqlSession, String memNum); // 알림 목록 조회
	int updateAlarm(SqlSession sqlSession, int alarmNo); // 알림 읽음 처리
	int updateAllAlarm(SqlSession sqlSession, String memNum); // 알림 모두 읽음 처리
	int selectOneList(SqlSession sqlSession, String memNum); // 알림 카운트
	int insertAlarm(SqlSession sqlSession, AlarmVO alarm); // 알림 등록
	int selectOneDocNo(SqlSession sqlSession, String memNum); // 문서 번호
	String selectOneName(SqlSession sqlSession, int docNo); // 기안자 이름 조회
	String selectOneForm(SqlSession sqlSession, int docNo); // 양식 이름 조회
	String selectOneNum(SqlSession sqlSession, int docNo); // 기안자 사원번호 조회
	String selectOneAppName(SqlSession sqlSession, String appMemNum); // 반려자 이름 조회
}
