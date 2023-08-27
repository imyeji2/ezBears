package com.ez.ezBears.attendance.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AttendanceServiceImpl implements AttendanceService{
	private final AttendanceDAO attendanceDao;
	
	
	@Override
	public List<AttendanceVO> selectByMemNo(int memNo) {
		return attendanceDao.selectByMemNo(memNo);
	}


	@Override
	public AttendanceVO selectRecentAttendance(int memNo) {
		return attendanceDao.selectRecentAttendance(memNo);
	}


	@Override
	public int insertAttendance(int memNo) {
		return attendanceDao.insertAttendance(memNo);
	}


	@Override
	public int selectAttendanceNo(int memNo) {
		return attendanceDao.selectAttendanceNo(memNo);
	}


	@Override
	public int goHome(int memNo) {
		return attendanceDao.goHome(memNo);
	}

}
