package com.ez.ezBears.chat.model;

import lombok.Data;

@Data
public class ChatMemberVO {
	private int chatRoomNo;
	private int memNo;
	private String deptName;
	private String memName;
	private String positionName;
	private int memStatus;
}