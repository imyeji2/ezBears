package com.ez.ezBears.attendance.model;

import java.util.List;

public interface AttendanceService {
	List<AttendanceVO> selectByMemNo(int memNo);

}
