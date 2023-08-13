package com.ez.ezBears.temNotice.model;

import java.sql.Timestamp;
import lombok.Data;

@Data
public class TeamNoticeVO {
	private int noticeNo;
	private int memNo;
	private int MBoardNo;
	private String teamNoticeTitle;
	private String teamNoticeContent;
	private Timestamp regdate;
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
