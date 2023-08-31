package com.ez.ezBears.board.model;

import lombok.Data;

@Data
public class BoardVO {
	private int boardNo; /* 자유게시판번호 */
	private int memNo; /* 사원번호 */
	private String boardTitle; /* 자유제목 */
	private String boardContent; /* 자유내용 */
	private String regdate; /* 자유등록일 */
	private String status; /* 자유공개상태 */
	private int likeCount; /* 좋아요 */
	private int groupNo; /* 그룹번호 */
	private int sortNo; /* 댓글순서 */
	private int step; /* 댓글여부 */
	private int views; /* 자유조회수 */
	private int randomnum;
}
