package com.ez.ezBears.schedule.model;

import java.util.List;

public interface ScheduleService {
	List<ScheduleVO> scheduleAll(int myBoardNo);

	int insertSchedule(ScheduleVO scheduleVo);

}
