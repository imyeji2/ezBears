package com.ez.ezBears.sign.model;

import lombok.Data;

@Data
public class SignFileVO {
	private int fileNo; /* 파일번호 */
	private int docNo;	 /* 문서번호 */
	private String fileName; /* 파일명 */
	private String originFileName; /* 원본파일명 */
	private long fsize; /* 파일사이즈 */
}
