package com.ez.ezBears.message.model;

import lombok.Data;

@Data
public class MessageReceiveVO {
	private int messageReceiveNo;
    private int receiveUserNo;
    private int messageSendNo;
    private String receiveTime;
    private String receiveDelFlag;
}
