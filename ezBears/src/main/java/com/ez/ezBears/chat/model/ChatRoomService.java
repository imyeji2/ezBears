package com.ez.ezBears.chat.model;

import java.util.List;
import java.util.Map;

public interface ChatRoomService {
	//채팅방 추가 서비스
	int addChatRoom(List<ChatMemberVO> chatMemberVo);
	
	//채팅방 리스트 출력
	List<Map<String, Object>> selectMyChatRoom(int memNo);
}
