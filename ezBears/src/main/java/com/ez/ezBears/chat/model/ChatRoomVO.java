package com.ez.ezBears.chat.model;

import lombok.Data;

@Data
public class ChatRoomVO {
	private int chatRoom;
	private String regdate;
	
	@Override
	public String toString() {
		return "ChatRoomVO [chatRoom=" + chatRoom + ", regdate=" + regdate + ", toString()=" + super.toString() + "]";
	}

}
