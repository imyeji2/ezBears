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
	public int comeCompanyLate(int attendanceNo) {
		return attendanceDao.comeCompanyLate(attendanceNo);
	}


	@Override
	public int comeCompanyGood(int attendanceNo) {
		return attendanceDao.comeCompanyGood(attendanceNo);
	}


	@Override
	public int goHome(AttendanceVO attendanceVo) {
		return attendanceDao.goHome(attendanceVo);
	}



}
