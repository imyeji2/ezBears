package com.ez.ezBears.schedule.model;

import java.util.List;
import java.util.Map;

public interface ScheduleService {
	List<Map<String, Object>> selectAll(ScheduleVO scheduleVo);
	int insertSchedule(ScheduleVO scheduleVo);

}
