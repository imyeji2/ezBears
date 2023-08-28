package com.ez.ezBears.teamWorkBoard.model;

import lombok.Data;

@Data
public class ToDoListDetailVO {
	private int toDoDetailNo;
	private int toDoListNo;
	private String toDoContent;
	private String regdate;
	private String status;

}
