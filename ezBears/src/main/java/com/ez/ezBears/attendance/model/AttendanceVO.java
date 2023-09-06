package com.ez.ezBears.attendance.model;

import lombok.Data;

@Data
public class AttendanceVO {
	private int attendanceNo;       
	private int memNo;       
	private String inTime;         
	private String outTime;         
	private String status;
}
