package com.ez.ezBears.schedule.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ScheduleDAO {
	
	//전체 일정 조회
	List<Map<String, Object>> selectAll(ScheduleVO scheduleVo);
	
	//일정등록
	int insertSchedule(ScheduleVO scheduleVo);
	
	
	//일정 수정
 
	int updateEvent(Map<String, Object> parameters);
	
	// 삭제
	boolean deleteEvent(int eventId);
}
