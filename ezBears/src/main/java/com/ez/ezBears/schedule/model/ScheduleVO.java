package com.ez.ezBears.schedule.model;

import lombok.Data;

@Data
public class ScheduleVO {
	private int scheduleNo;	 /* 스케줄번호 */
	private int memNo;  /* 사원번호 */
	private int myBoardNo; /* 보드리스트번호 */
	private String schedulStart;  /* 시작일 */
	private String schedulEnd;  /* 종료일 */
	private String schedulTitle; /* 제목 */
	private String schedulContent; /* 내용 */
	
	//뷰에서 받아온 memId 저장
	private String memId;
	private int mBoardNo;
	
}
