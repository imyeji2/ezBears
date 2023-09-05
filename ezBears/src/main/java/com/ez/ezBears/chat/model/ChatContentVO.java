package com.ez.ezBears.chat.model;

import java.util.Date;

import lombok.Data;
@Data
public class ChatContentVO {
	private int chatContentNo;
	private int chatRoomNo;
	private String chatContent;
	private int memNo;
	private String deptName;
	private String memName;
	private String positionName;
	private Date chatDate;
	private String chatDateFormat;
	private int chatType;
}
