package com.ez.ezBears.chat.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ChatRoomServiceImpl implements ChatRoomService{
	private final ChatRoomDAO chatRoomDao;
	private final ChatMemberDAO chatMemberDao;
	
	
	//채팅방 추가 서비스
	@Transactional
	@Override
	public int addChatRoom(List<ChatMemberVO> chatMemberVo) {
		int cnt =0;
		
		try {	
			ChatRoomVO roomVo = new ChatRoomVO();
			chatRoomDao.insertChatRoom(roomVo);
			int chatRoomNo = roomVo.getChatRoomNo();
			System.out.println("채팅방 생성 채팅방 번호="+chatRoomNo);
			
			for(int i=0; i<chatMemberVo.size();i++) {
				ChatMemberVO memberVo = chatMemberVo.get(i);
				
				memberVo.setChatRoomNo(chatRoomNo);
				System.out.println("채팅방 멤버 vo="+memberVo);
				cnt = chatMemberDao.insertChatMember(memberVo);
			}
			
			
		}catch(RuntimeException e) {
			//선언적 트랜젝션(@Transactional)에서는
			//런타임 예외가 발생하면 롤백한다.
			e.printStackTrace();
			cnt=-1;//예외처리를 했다는 의미->예외 발생
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
	}


	//채팅방 리스트 출력
	@Override
	public List<Map<String, Object>> selectMyChatRoom(int memNo) {
		return chatRoomDao.selectMyChatRoom(memNo);
	}

}
