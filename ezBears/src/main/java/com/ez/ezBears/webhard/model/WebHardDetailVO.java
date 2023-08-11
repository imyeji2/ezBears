package com.ez.ezBears.webhard.model;

import lombok.Data;

@Data
public class WebHardDetailVO {
	private int fileNo;	 /* 파일번호 */
	private int webHardNo;	 /* 웹하드번호 */
	private int downCount;	 /* 다운카운트 */
	private long fsize;/* 파일사이즈 */
	private String originFilename;	 /* 오리지널이름 */
	private String filename;	 /* 파일이름 */
}
