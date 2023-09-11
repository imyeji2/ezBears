package com.ez.ezBears.chat.model;

import java.util.List;
import java.util.Map;

public interface ChatMessageService {
	//메세지 등록
	int insertChatMessage(ChatMessageVO messageVo);
	
	//채팅방별 메시지 출력
	List<Map<String,Object>> selectChatRoomMessage(int chatRoomNo);
}
