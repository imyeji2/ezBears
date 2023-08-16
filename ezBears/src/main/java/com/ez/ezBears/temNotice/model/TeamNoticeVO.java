package com.ez.ezBears.temNotice.model;

import lombok.Data;

@Data
public class TeamNoticeVO {
	private int teamNoticeNo;
	private int memNo;
	private int MyBoardNo;
	private String teamNoticeTitle;
	private String teamNoticeContent;
	private String regdate;
	private int views;
	private String comments;
	private long fsize;
	private String fileName;
	private String originname;
	private int gropno;
	private int sortno;
	private int step;
	private String status;
	
}
