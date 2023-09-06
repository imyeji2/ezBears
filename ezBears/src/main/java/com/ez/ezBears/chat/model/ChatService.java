package com.ez.ezBears.chat.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.ez.ezBears.member.model.MemberVO;

public interface ChatService {

	int registerChatRoom(ChatRoomVO chatRoom); // 채팅방 생성
	int registerChatMember(SqlSession sqlsession, String MemName); // 채팅방 사용자 등록
	List<ChatMemberVO> printAllMember(ChatRoomVO chatRoom); // 채팅방 사용자 목록 조회
	int registerChatContent(ChatContentVO chatContent); // 채팅 등록
	int printChatRoomNo(); // 채팅방 번호 불러오기
	List<ChatRoomVO> printAllChatRoom(int chatListNo); // 채팅방 목록 조회
	ChatContentVO printChatContent(int chatRoomNo); // 마지막 대화 내용과 날짜 가져오기
	List<ChatContentVO> printAllChat(int chatRoomNo); // 채팅 목록
	int printChatMemberCount(int chatRoomNo); // 채팅 인원수 조회
	ChatRoomVO printChatRoom(int chatRoomNo); // 채팅방 정보 조회
	int modifyStatusChatMember(ChatMemberVO chatMember); // 채팅방 나가기
	int modifyChatTitle(ChatRoomVO chatRoom); // 채팅방 제목 변경
	ChatMemberVO printChatMember(ChatMemberVO chatMember); // 채팅방 사용자 조회
	int fineContentDate(ChatContentVO chatContent); // 날짜 공지 찾기
	int inviteChatMember(ChatMemberVO member); // 사용자 추가 초대
	int modifyStatusChatRoom(ChatRoomVO chatRoom); // 채팅방 종류 변경
	int removeChatRoom(int chatRoomNo); // 채팅방 삭제

}
