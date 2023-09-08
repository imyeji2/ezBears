package com.ez.ezBears.message.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

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
	public int receiveMessageDel(int delNo) {
		return messageDao.receiveMessageDel(delNo);
	}




}
