package com.ez.ezBears.chat.model;

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

}
