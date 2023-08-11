package com.ez.ezBears.notice.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class NoticeVO {
	private int NOTICE_NO;  /* 공지사항번호 */
	private int MEM_NO; /* 사원번호 */
	private String NOTICE_TITLE; /* 공지제목 */
	private String NOTICE_CONTENT; /* 공지내용 */
	private Timestamp REGDATE; /* 공지등록일 */
	private String STATUS; /* 공지공개상태 */
	private int VIEWS; /* 조회수 */
	private long FSIZE; /* 파일사이즈 */
	private String FILENAME; /* 파일이름 */
	private int DOWN_COUNT; /* 다운카운트 */
	private String ORIGIN_FILENAME; /* 오리지널이름 */
}
