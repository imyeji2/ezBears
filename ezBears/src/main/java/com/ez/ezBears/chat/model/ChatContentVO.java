package com.ez.ezBears.chat.model;

import java.util.Date;

import lombok.Data;
@Data
public class ChatContentVO {
	private int chatContentNo;
	private int chatRoomNo;
	private String chatContent;
	private String memNum;
	private String divName;
	private String memName;
	private String rankName;
	private Date chatDate;
	private String chatDateFormat;
	private int chatType;
}
