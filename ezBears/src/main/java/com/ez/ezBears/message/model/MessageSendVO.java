package com.ez.ezBears.message.model;

import lombok.Data;

@Data
public class MessageSendVO {
	private int messageSendNo;
    private int sendUserNo;
    private String sendTime;
    private String content;
    private String sendDelFlag;
}
