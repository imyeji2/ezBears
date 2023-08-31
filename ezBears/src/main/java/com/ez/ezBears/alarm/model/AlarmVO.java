package com.ez.ezBears.alarm.model;

import lombok.Data;

@Data
public class AlarmVO {
	private int alarmNo;
	private String memNum;
	private String kind;
	private String alarmContent;
	private String alarmDate;
	private String alarmStatus;
	private String alarmUrl;
}
