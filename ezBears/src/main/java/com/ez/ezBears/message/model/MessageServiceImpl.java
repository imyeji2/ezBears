package com.ez.ezBears.message.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MessageServiceImpl implements MessageService{
	private final MessageDAO messageDao;
	
	
	@Override
	public int SendMessage(MessageSendVO messageSendVo) {
		return messageDao.SendMessage(messageSendVo);
				
	}


	@Override
	public int ReceiveMessage(int messageSendNo, MessageReceiveVO messageReceveVo) {
		return messageDao.ReceiveMessage(messageSendNo, messageReceveVo);
	}


	@Override
	public List<Map<String, Object>> selectSendBox(int sendUserNo) {
		return messageDao.selectSendBox(sendUserNo);
	}


	@Override
	public List<Map<String, Object>> selectReceiveBox(int receiveUserNo) {
		return messageDao.selectReceiveBox(receiveUserNo);
	}


	@Override
	@Transactional
	public int receiveMessageDelMulti(List<Integer> messageSendNos) {
		int cnt = 0;
		int total = 0;
		
		try {
			for(int num : messageSendNos) {
					cnt = messageDao.receiveMessageDel(num);
					total += cnt;
			} //for
		}catch (RuntimeException e) {
			//선언적 트랜잭션에서는 런타임 예외가 발생하면 롤백한다.
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return total;
	}


	@Override
	@Transactional
	public int sendMessageDelMulti(List<Integer> messageSendNos) {
		int cnt = 0;
		int total = 0;
		
		try {
			for(int num : messageSendNos) {
					cnt = messageDao.sendMessageDel(num);
					total += cnt;
			} //for
		}catch (RuntimeException e) {
			//선언적 트랜잭션에서는 런타임 예외가 발생하면 롤백한다.
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return total;
	}


	@Override
	public List<Integer> dropMessageList() {
		return messageDao.dropMessageList();
	}


	@Override
	@Transactional
	public int delMessage(int delNo) {
		int cnt, cnt2, total = 0;
		
		try {
			cnt = messageDao.delMessageReceive(delNo);
			cnt2 = messageDao.delMessageSend(delNo);
			total += cnt2;
		}catch (RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return total;
	}



	




}
