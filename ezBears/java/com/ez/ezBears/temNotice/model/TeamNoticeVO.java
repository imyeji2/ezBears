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
	private int contentno;//게시글번호
	private int groupno;//그룹번호
	private int sortno;//정렬순서
	private int step;//댓글여부
	private String status;
	
	
}
