package com.ez.ezBears.chat.model;

import lombok.Data;

@Data
public class ChatRoomVO {
	private int chatRoomNo;
	private String chatRoomTitle;
	private int chatRoomType;
	private String chatContent;
	private String chatDate;
	private int headCount;
}
