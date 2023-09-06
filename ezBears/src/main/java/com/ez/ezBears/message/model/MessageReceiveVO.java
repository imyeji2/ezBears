package com.ez.ezBears.message.model;

import lombok.Data;

@Data
public class MessageReceiveVO {
	private int messageReceiveNo;
    private String receiveUserId;
    private int messageSendNo;
    private String receiveTime;
}
