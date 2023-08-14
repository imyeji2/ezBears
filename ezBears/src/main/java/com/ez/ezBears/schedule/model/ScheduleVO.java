package com.ez.ezBears.schedule.model;

import java.sql.Date;

import lombok.Data;

@Data
public class ScheduleVO {
	private int scheduleNo;	 /* 스케줄번호 */
	private int memNo;  /* 사원번호 */
	private int myBoardNo; /* 보드리스트번호 */
	private Date schedulStart;  /* 시작일 */
	private Date schedulEnd;  /* 종료일 */
	private String schedulTitle; /* 제목 */
	private String schedulContent; /* 내용 */
}
