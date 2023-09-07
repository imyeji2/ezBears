package com.ez.ezBears.message.model;

import lombok.Data;

@Data
public class MessageVO {
	private int messageNo;
	private int sendUserNo;
	private int receiveUserNo;
	private int messageDetailNo;
    private String sendTime;
    
	
}
