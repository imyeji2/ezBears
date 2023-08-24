package com.ez.ezBears.schedule.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ScheduleServiceImpl implements ScheduleService {
	private final ScheduleDAO scheduleDao;

	


	@Override
	public int insertSchedule(ScheduleVO scheduleVo) {
		return scheduleDao.insertSchedule(scheduleVo);
	}




	@Override
	public List<Map<String, Object>> selectAll(ScheduleVO scheduleVo) {
		return scheduleDao.selectAll(scheduleVo);
	}



	
	
	
	
}
