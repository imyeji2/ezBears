package com.ez.ezBears.webhard.model;

import java.sql.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class WebHardVO extends WebHardDetailVO {
	private int webHardNo;	 /* 웹하드번호 */
	private int memNo; /* 사원번호 */
	private int mBoardNo;  /* 보드리스트번호 */
	private String hardTitle;  /* 제목 */
	private String hardContent; /* 내용 */
	private Date regdate; /* 등록일 */
	private String status; /* 상태 */
	private int views; /* 조회수 */
}
