package com.ez.ezBears.message.model;

import lombok.Data;

@Data
public class MessageSendVO {
	private int messageSendNo;
    private String sendUserId;
    private String sendTime;
    private String content;
}
