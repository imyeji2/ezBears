package com.ez.ezBears.chat.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ChatMemberServiceImpl implements ChatMemberService {
	private final ChatMemberDAO chatMemberDao;
	
	//채팅방 멤버 번호 찾기(내번호)
	@Override
	public int selectChatMemberNo(ChatMemberVO memberVo) {
		return chatMemberDao.selectChatMemberNo(memberVo);
	}

}
