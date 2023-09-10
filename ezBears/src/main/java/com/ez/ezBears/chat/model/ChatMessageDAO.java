package com.ez.ezBears.chat.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChatMessageDAO {
	//메세지 등록
	int insertChatMessage(ChatMessageVO messageVo);
	
	//채팅방별 메시지 출력
	List<Map<String,Object>> selectChatRoomMessage(int chatRoomNo);
}
