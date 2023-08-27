package com.ez.ezBears.attendance.model;

import java.util.List;

public interface AttendanceService {
	List<AttendanceVO> selectByMemNo(int memNo);
	AttendanceVO selectRecentAttendance(int memNo);
	int insertAttendance(int memNo);
	int selectAttendanceNo(int memNo);
	int goHome(int memNo);

}
