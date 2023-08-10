package com.ez.ezBears.member.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberVO {
<<<<<<< HEAD
	private int MEM_NO; /* 사원번호 */
	private int DEPT_NO; /* 부서번호 */
	private int POSITION_NO; /* 직급번호 */
	private String MEM_NAME; /* 사원이름 */
	private String MEM_ID; /* 사원아이디 */
	private Timestamp MEM_BIRTH; /*사원생년월일 */
	private String MEM_PWD; /* 사원비밀번호 */
	private String MEM_TEL; /* 핸드폰번호 */
	private int MEM_SAL; /* 연봉 */
	private Timestamp CONTRACT_START; /* 입사일 */
	private Timestamp CONTRACT_DONE; /* 퇴사일 */
	private String TYPE; /* 고용형태 */
	private String MEM_ADDRESS; /* 주소 */
	private String MEM_ADDRESS_DETAIL; /* 주소상세 */
	private String MEM_ZIPCODE; /* 우편번호 */
	private String MEM_IMAGE; /* 이미지 */
=======
	private int memNo; /* 사원번호 */
	private int deptNo; /* 부서번호 */
	private int positionNo; /* 직급번호 */
	private String memName; /* 사원이름 */
	private String memId; /* 사원아이디 */
	private Timestamp memBirth; /*사원생년월일 */
	private String memPwd; /* 사원비밀번호 */
	private String memTel; /* 핸드폰번호 */
	private int memSal; /* 연봉 */
	private Timestamp contractStart; /* 입사일 */
	private Timestamp contractDone; /* 퇴사일 */
	private String type; /* 고용형태 */
	private String memAddress; /* 주소 */
	private String memDetail; /* 주소상세 */
	private String memZipcode; /* 우편번호 */
	private String memIMG; /* 이미지 */
>>>>>>> branch 'main' of https://github.com/GunwooRoh/FinalProject.git
}
