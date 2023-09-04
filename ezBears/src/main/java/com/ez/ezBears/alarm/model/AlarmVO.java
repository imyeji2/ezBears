package com.ez.ezBears.alarm.model;

import lombok.Data;

@Data
public class AlarmVO {
	private int alarmNo;
	private int memNo;
	private String kind;
	private String alarmContent;
	private String alarmDate;
	private String alarmStatus;
	private String alarmUrl;
}
