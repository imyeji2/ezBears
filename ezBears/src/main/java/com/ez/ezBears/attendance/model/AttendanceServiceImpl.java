package com.ez.ezBears.attendance.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ez.ezBears.common.SearchVO;

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


	@Override
	public List<Map<String, Object>> selectAllThisMonth(int memNo, String date) {
		return attendanceDao.selectAllThisMonth(memNo, date);
	}


	@Override
	public int countComeLate(int memNo, String date) {
		return attendanceDao.countComeLate(memNo, date);
	}


	@Override
	public int countComeGood(int memNo, String date) {
		return attendanceDao.countComeGood(memNo, date);
	}


	@Override
	public int countGoEarly(int memNo, String date) {
		return attendanceDao.countGoEarly(memNo, date);
	}



	@Override
	public List<Map<String, Object>> selectAllView(SearchVO searchVo, String date11, String date22, int searchDeptNo,
			String searchName) {
		return attendanceDao.selectAllView(searchVo, date11, date22, searchDeptNo, searchName);
	}


	@Override
	public int countAllView(String date11, String date22, int searchDeptNo, String searchName) {
		return attendanceDao.countAllView(date11, date22, searchDeptNo, searchName);
	}




}
