package com.ez.ezBears.chat.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ChatMessageServiceImpl implements ChatMessageService{
	private final ChatMessageDAO chatMessageDao;
	
	@Override
	public int insertChatMessage(ChatMessageVO messageVo) {
		return chatMessageDao.insertChatMessage(messageVo);
	}
	
	
	//채팅방별 메시지 출력
	@Override
	public List<Map<String, Object>> selectChatRoomMessage(int chatRoomNo) {
		return chatMessageDao.selectChatRoomMessage(chatRoomNo);
	}

}
