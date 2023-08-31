package com.ez.ezBears.chat.model;

import lombok.Data;

@Data
public class ChatMemberVO {
	private int chatRoomNo;
	private int memNo;
	private String divName;
	private String memName;
	private String rankName;
	private int memStatus;
	
}