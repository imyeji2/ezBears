package com.ez.ezBears.MBoard.model;

import lombok.Data;

@Data
public class MBoardVO {
	private int MBoardNo;
	private int memNo;
	private String MBoardName;
	
	//게시판 리스트 view
	private String memName;
	private int deptNo;
	private String deptName;
	private String deptTel;
	private String status;
	
}
