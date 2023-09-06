package com.ez.ezBears.notice.model;

import lombok.Data;

@Data
public class NoticeFileVO {
	private int noticeFileNo;
	private int noticeNo;
	private String fileName;
	private long fileSize;
	private int downCount;
	private String originFileName;
}