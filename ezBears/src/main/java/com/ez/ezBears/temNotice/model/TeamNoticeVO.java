package com.ez.ezBears.temNotice.model;

import lombok.Data;

@Data
public class TeamNoticeVO {
	private int teamNoticeNo;
	private int memNo;
	private int myBoardNo;
	private String teamNoticeTitle;
	private String teamNoticeContent;
	private String regdate;
	private int views;
	private String comments;
	private long fsize;
	private String fileName;
	private String originname;
	private int groupno;
	private int sortno;
	private int step;
	private String status;
	
}
