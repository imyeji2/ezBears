package com.ez.ezBears.notice.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class NoticeVO {
	private int noticeNo; /* 공지사항번호 */
	private int memNo; /* 사원번호 */
	private String noticeTitle; /* 공지제목 */
	private String noticeContent; /* 공지내용 */
	private String regdate; /* 공지등록일 */
	private String status; /* 공지공개상태 */
	private int views; /* 조회수 */
	//private long fsize; /* 파일사이즈 */
	//private String filename; /* 파일이름 */
	//private int downCount; /* 다운카운트 */
	//private String originFilename; /* 오리지널이름 */
}
