package com.ez.ezBears.teamWorkBoard.model;

import lombok.Data;

@Data
public class TeamWorkBoardVO {
	private int teamBoardNo;
	private int memNo;
	private int mBoardNo;
	private String teamBoardTitle;
	private String teamBoardContent;
	private String regdate;
	private int views;
	private String comment;
	private long fsize;
	private String fileName;
	private String originFileName;
	private int groupNo;
	private int sortNo;
	private int step;
	private String status;
	private int contentNo;
}
