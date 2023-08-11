package com.ez.ezBears.staff.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class StaffVO {
	private int staffNo;        
	private int deptNo;        
	private String staffName; 
	private String staffPosition; 
	private int staffBackNo;        
	private Timestamp staffBirth;          
	private int staffSal;        
	private Timestamp contractStart;
	private Timestamp contractDone;
	private String staffTel;
	private String staffInfo; 
	private String staffAddr; 
	private String staffAddrDetail; 
	private String staffZipcode;  
	private String staffStatus;  
	private String staffId;  
	private String staffPwd;  
	private String staffImage;
}
