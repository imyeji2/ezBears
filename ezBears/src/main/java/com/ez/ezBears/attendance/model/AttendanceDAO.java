package com.ez.ezBears.attendance.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface AttendanceDAO {
	List<AttendanceVO> selectByMemNo(int memNo);
	AttendanceVO selectRecentAttendance(int memNo);
	int insertAttendance(int memNo);
	int selectAttendanceNo(int memNo);
	int goHome(int memNo);
}
