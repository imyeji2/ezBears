package com.ez.ezBears.chat.model;

import lombok.Data;

@Data
public class ChatMessageVO {
	private int chatMessageNo;
	private int chatMemberNo;
	private String chatMessage;
	private String readChat;
	private String regdate;
	
	
}

