package com.ez.ezBears.emp.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class MemberVO {
	private int memNo;
	private int deptNo;
	private int positionNo;
	private String memName;
	private String memId;
	private String memPwd;
	private String memTel;
	private int memSal;
	private Timestamp contrtactStart;
	private Timestamp contrtactDone;
	private String type;
	private String memAddress;
	private String memAdressDetail;
	private String memZipcode;
	private String memImage;
}
