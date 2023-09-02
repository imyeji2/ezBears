package com.ez.ezBears.teamWorkBoard.model;

import lombok.Data;

@Data
public class TeamWorkBoardVO {
	private int teamBoardNo;
	private int memNo;
	private int myBoardNo;
	private String teamBoardTitle;
	private String teamBoardContent;
	private String regdate;
	private int views;
	private String comments;
	private long fsize;
	private String fileName;
	private String originFileName;
	private int groupNo;
	private int sortno;
	private int step;
	private String status;
	private int contentno;
}
