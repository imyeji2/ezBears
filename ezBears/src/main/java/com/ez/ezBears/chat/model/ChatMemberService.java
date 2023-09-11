package com.ez.ezBears.chat.model;


public interface ChatMemberService {
	//채팅방 멤버 번호 찾기(내번호)
	int selectChatMemberNo(ChatMemberVO memberVo);
}
