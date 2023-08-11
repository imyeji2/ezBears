package com.ez.ezBears.sign.model;

import lombok.Data;

@Data
public class SignLineVO {
	private int signLineNo;  /* 결재라인번호 */
	private int docNo;  /* 문서번호 */
	private int memNo;  /* 사원번호 */
	private int signLine;  /* 결재순서 */
}
