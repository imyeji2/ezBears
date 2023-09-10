package com.ez.ezBears.chat.model;

import lombok.Data;

@Data
public class ChatMemberVO {
	private int chatMemberNo;
	private int memNo;
	private int chatRoomNo;
	
	@Override
	public String toString() {
		return "ChatMemberVO [chatMemberNo=" + chatMemberNo + ", memNo=" + memNo + ", chatRoomNo=" + chatRoomNo
				+ ", toString()=" + super.toString() + "]";
	}
	
	
}
