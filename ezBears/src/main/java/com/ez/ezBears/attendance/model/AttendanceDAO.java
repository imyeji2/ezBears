package com.ez.ezBears.attendance.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface AttendanceDAO {
	List<AttendanceVO> selectByMemNo(int memNo);
	AttendanceVO selectRecentAttendance(int memNo);
	int insertAttendance(int memNo);
	int selectAttendanceNo(int memNo);
	int comeCompanyLate(int attendanceNo);
	int comeCompanyGood(int attendanceNo);
	int goHome(AttendanceVO attendanceVo);
	List<Map<String, Object>> selectAllThisMonth(@Param ("memNo") int memNo, @Param("date") String date );
	int countComeLate(@Param ("memNo") int memNo, @Param("date") String date );
	int countComeGood(@Param ("memNo") int memNo, @Param("date") String date );
	int countGoEarly(@Param ("memNo") int memNo, @Param("date") String date );
	List<Map<String, Object>> selectAllView();
}
