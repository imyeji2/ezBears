package com.ez.ezBears.chat.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import com.ez.ezBears.chat.model.ChatContentVO;
import com.ez.ezBears.chat.model.ChatMemberVO;
import com.ez.ezBears.chat.model.ChatRoomVO;
import com.ez.ezBears.chat.model.ChatService;


import lombok.RequiredArgsConstructor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ChatServiceImpl implements ChatService {
	private final ChatStoreDAO chatStoreDao;

	private final SqlSession sqlSession;

	@Override
	public int registerChatRoom(ChatRoomVO chatRoom) { // 채팅방 생성
		int result = chatStoreDao.registerChatRoom(chatRoom);
		return result;
	}

	@Override
	public int registerChatMember(SqlSession sqlSession, String memName) { // 채팅방 사용자 등록
		int result = chatStoreDao.registerChatMember(sqlSession, memName);
		return result;
	}

	@Override
	public List<ChatMemberVO> printAllMember(ChatRoomVO chatRoom) { // 채팅방 사용자 목록 조회
		List<ChatMemberVO> mList = chatStoreDao.printAllMember(sqlSession, chatRoom);
		return mList;
	}

	@Override
	public int registerChatContent(ChatContentVO chatContent) { // 채팅 등록
		int result = chatStoreDao.registerChatContent(sqlSession, chatContent);
		return result;
	}
	
	@Override
	public int printChatRoomNo() { // 채팅방 번호 불러오기
		int chatRoomNo = chatStoreDao.printChatRoomNo(sqlSession);
		return chatRoomNo;
	}

	@Override
	public List<ChatRoomVO> printAllChatRoom(int memNo) { // 채팅방 목록 조회
		List<ChatRoomVO> rList = chatStoreDao.printAllChatRoom(sqlSession, memNo);
		return rList;
	}

	@Override
	public ChatContentVO printChatContent(int chatRoomNo) { // 마지막 대화 내용과 날짜 가져오기
		ChatContentVO chatContent = chatStoreDao.printChatContent(sqlSession, chatRoomNo);
		return chatContent;
	}

	@Override
	public List<ChatContentVO> printAllChat(int chatRoomNo) { // 채팅 목록
		List<ChatContentVO> cList = chatStoreDao.printAllChat(sqlSession, chatRoomNo);
		return cList;
	}
	
	@Override
	public int printChatMemberCount(int chatRoomNo) { // 채팅 인원수 조회
		int count = chatStoreDao.printChatMemberCount(sqlSession, chatRoomNo);
		return count;
	}
	
	@Override
	public ChatRoomVO printChatRoom(int chatRoomNo) { // 채팅방 정보 조회
		ChatRoomVO chatRoom = chatStoreDao.printChatRoom(sqlSession, chatRoomNo);
		return chatRoom;
	}
	
	@Override
	public int modifyStatusChatMember(ChatMemberVO chatMember) { // 사용자 상태 변경
		int result = chatStoreDao.modifyStatusChatMember(sqlSession, chatMember);
		return result;
	}
	
	@Override
	public int modifyChatTitle(ChatRoomVO chatRoom) { // 채팅방 제목 변경
		int result = chatStoreDao.modifyChatTitle(sqlSession, chatRoom);
		return result;
	}

	@Override
	public ChatMemberVO printChatMember(ChatMemberVO chatMember) { // 채팅방 사용자 조회
		ChatMemberVO member = chatStoreDao.printChatMember(sqlSession, chatMember);
		return member;
	}

	@Override
	public int fineContentDate(ChatContentVO chatContent) { // 날짜 공지 찾기
		int fineCount = chatStoreDao.fineContentDate(sqlSession, chatContent);
		return fineCount;
	}

	@Override
	public int inviteChatMember(ChatMemberVO member) { // 사용자 추가 초대
		int result = chatStoreDao.inviteChatMember(sqlSession, member);
		return result;
	}

	@Override
	public int modifyStatusChatRoom(ChatRoomVO chatRoom) { // 채팅방 종류 변경
		int result = chatStoreDao.modifyStatusChatRoom(sqlSession, chatRoom);
		return result;
	}

	@Override
	public int removeChatRoom(int chatRoomNo) { // 채팅방 삭제
		int result = chatStoreDao.removeChatRoom(sqlSession, chatRoomNo);
		return result;
	}

}
