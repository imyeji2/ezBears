package com.ez.ezBears.chat.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChatRoomDAO {
	//채팅방 추가
	int insertChatRoom(ChatRoomVO chatRoomVo);
	int addChatRoom(List<ChatMemberVO> chatMemberVo);
}
