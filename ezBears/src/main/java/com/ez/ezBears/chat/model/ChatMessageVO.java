package com.ez.ezBears.chat.model;

import lombok.Data;

@Data
public class ChatMessageVO {
	private int chatMessageNo;
	private int chatRoomNo;
	private String chatMessage;
	private String chatDate;
	private String readChat;
	@Override
	public String toString() {
		return "ChatMessageVO [chatMessageNo=" + chatMessageNo + ", chatRoomNo=" + chatRoomNo + ", chatMessage="
				+ chatMessage + ", chatDate=" + chatDate + ", readChat=" + readChat + ", toString()=" + super.toString()
				+ "]";
	}
	
	
}

