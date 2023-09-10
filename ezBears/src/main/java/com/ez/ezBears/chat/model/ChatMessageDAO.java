package com.ez.ezBears.chat.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChatMessageDAO {
	//메세지 등록
	int insertChatMessage(ChatMessageVO messageVo);
}
