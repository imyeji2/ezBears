package com.ez.ezBears.chat.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChatRoomDAO {
	//채팅방 추가
	int insertChatRoom(ChatRoomVO chatRoomVo);
	int addChatRoom(List<ChatMemberVO> chatMemberVo);
	
	//채팅방 리스트 출력
	List<Map<String, Object>> selectMyChatRoom(int memNo);
}
