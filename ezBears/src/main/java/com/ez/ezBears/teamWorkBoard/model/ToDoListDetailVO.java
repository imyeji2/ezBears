package com.ez.ezBears.teamWorkBoard.model;

import lombok.Data;

@Data
public class ToDoListDetailVO {
	private int todoDetailNo;
	private int todolistNo;
	private String todoContent;
	private String regdate;
	private String status;
	private int memNo;

}
