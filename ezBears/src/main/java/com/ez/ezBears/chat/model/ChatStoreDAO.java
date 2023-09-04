package com.ez.ezBears.chat.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;

@Mapper
public interface ChatStoreDAO  {
	int registerChatRoom(ChatRoomVO chatRoom); // 채팅방 생성
	int registerChatMember(SqlSession sqlSession, String memName); // 채팅방 사용자 등록
	List<ChatMemberVO> printAllMember(SqlSession sqlSession, ChatRoomVO chatRoom); // 채팅방 사용자 목록 조회
	int registerChatContent(SqlSession sqlSession, ChatContentVO chatContent); // 채팅 등록
	int printChatRoomNo(SqlSession sqlSession); // 채팅방 번호 불러오기
	List<ChatRoomVO> printAllChatRoom(SqlSession sqlSession, int chatListNo); // 채팅방 목록 조회
	ChatContentVO printChatContent(SqlSession sqlSession, int chatRoomNo); // 마지막 대화 내용과 날짜 가져오기
	List<ChatContentVO> printAllChat(SqlSession sqlSession, int chatRoomNo); // 채팅 목록
	int printChatMemberCount(SqlSession sqlSession, int chatRoomNo); // 채팅 인원수 조회
	ChatRoomVO printChatRoom(SqlSession sqlSession, int chatRoomNo); // 채팅방 정보 조회
	int modifyStatusChatMember(SqlSession sqlSession, ChatMemberVO chatMember); // 채팅방 나가기
	int modifyChatTitle(SqlSession sqlSession, ChatRoomVO chatRoom); // 채팅방 제목 변경
	ChatMemberVO printChatMember(SqlSession sqlSession, ChatMemberVO chatMember); // 채팅방 사용자 조회
	int fineContentDate(SqlSession sqlSession, ChatContentVO chatContent); // 날짜 공지 찾기
	int inviteChatMember(SqlSession sqlSession, ChatMemberVO member); // 사용자 추가 초대
	int modifyStatusChatRoom(SqlSession sqlSession, ChatRoomVO chatRoom); // 채팅방 종류 변경
	int removeChatRoom(SqlSession sqlSession, int chatRoomNo);
}
