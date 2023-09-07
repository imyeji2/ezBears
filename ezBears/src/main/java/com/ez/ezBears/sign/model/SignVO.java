package com.ez.ezBears.sign.model;

import java.sql.Date;
import java.text.SimpleDateFormat;

import lombok.Data;

@Data
public class SignVO {
	
	private int docNo; /* 문서번호 */
	private int deptNo;	 /* 부서번호 */
	private int myBoardNo;	 /* 보드리스트번호 */
	private int memNo;	 /* 사원번호 */
	private String docTitle;	 /* 제목 */
	private String docContent;	 /* 내용 */
	private String regdate;	/* 기안일자 */
	private Date accept;	/* 승인일 */
	private String status;	 /* 처리상태 */
	private String fileStatus;	 /* 파일첨부여부 */
	private String delStatus;	 /* 삭제여부 */
	
	public void setRegDate(Date regDate) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        this.regdate = dateFormat.format(regDate);
    }
}
