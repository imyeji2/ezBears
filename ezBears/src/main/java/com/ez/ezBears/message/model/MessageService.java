package com.ez.ezBears.message.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface MessageService {
	int SendMessage(MessageSendVO messageSendVo);
	int ReceiveMessage(@Param("messageSendNo") int messageSendNo, @Param("messageReceiveVo") MessageReceiveVO messageReceveVo);
	List<Map<String, Object>> selectSendBox(int sendUserNo);
	List<Map<String, Object>> selectReceiveBox(int receiveUserNo);
	int receiveMessageDelMulti(List<Integer> messageSendNos);
	int sendMessageDelMulti(List<Integer> messageSendNos);
	List<Integer> dropMessageList();
	int delMessage(int delNo);
	
}
