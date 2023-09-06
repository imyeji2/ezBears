package com.ez.ezBears.dept.model;

import lombok.Data;

@Data
public class DeptVO {
	private int deptNo; /* 부서번호 */
	private String deptName; /* 부서명 */
	private String deptTel; /* 부서대표전화번호 */
	private String status; /* 활성화 여부 */
	
	private int memberCount;
}
