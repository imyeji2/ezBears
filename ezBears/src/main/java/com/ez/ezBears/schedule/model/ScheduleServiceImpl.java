package com.ez.ezBears.schedule.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ScheduleServiceImpl implements ScheduleService {
	private final ScheduleDAO scheduleDao;

	

	// 일정 등록
	@Override
	public int insertSchedule(ScheduleVO scheduleVo) {
		return scheduleDao.insertSchedule(scheduleVo);
	}



	// 일정 출력
	@Override
	public List<Map<String, Object>> selectAll(ScheduleVO scheduleVo) {
		return scheduleDao.selectAll(scheduleVo);
	}




	@Override
	public int updateEvent(Map<String, Object> parameters) {
		return scheduleDao.updateEvent(parameters);
	}



	/*
	 * @Override public Map<String, Object> updateEvent(int scheduleNo) { return
	 * scheduleDao.updateEvent(scheduleNo); }
	 */


	
	
	
}
