package com.ez.ezBears.schedule.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ScheduleServiceImpl implements ScheduleService {
	private final ScheduleDAO scheduleDao;

	@Override
	public List<ScheduleVO> scheduleAll(int myBoardNo) {
		return scheduleDao.scheduleAll(myBoardNo);
		
	}

	@Override
	public int insertSchedule(ScheduleVO scheduleVo) {
		return scheduleDao.insertSchedule(scheduleVo);
	}
	
	
	
	
}
