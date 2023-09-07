package com.ez.ezBears.myBoard.model;

import lombok.Data;

@Data
public class MyBoardMemberVO {
	private int memNo; /* 사원번호 */
	private int deptNo; /* 부서번호 */
	private int positionNo; /* 직급번호 */
	private String memName; /* 사원이름 */
	private String memId; /* 사원아이디 */
	private String memBirth; /*사원생년월일 */
	private String memPwd; /* 사원비밀번호 */
	private String memTel; /* 핸드폰번호 */
	private int memSal; /* 연봉 */
	private String contractStart; /* 입사일 */
	private String contractDone; /* 퇴사일 */
	private String type; /* 고용형태 */
	private String memAddress; /* 주소 */
	private String memAddressDetail; /* 주소상세 */
	private String memZipcode; /* 우편번호 */
	private String memImage; /* 이미지 */
	
	private String deptName;
	private String positionName;
	
	private int myBoardNo;
	private int MboardNo;
	private String status;
	
	
}
