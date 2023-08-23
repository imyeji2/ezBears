package com.ez.ezBears.schedule.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ScheduleDAO {
	List<ScheduleVO> scheduleAll(int myBoardNo);
	
	//일정등록
	int insertSchedule(ScheduleVO scheduleVo);

}
