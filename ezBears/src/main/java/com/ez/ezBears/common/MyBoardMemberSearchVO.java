package com.ez.ezBears.common;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MyBoardMemberSearchVO extends SearchVO{
	private int mBoardNo;
	private int deptNo;
	
	@Override
	public String toString() {
		return "MyBoardMemberSearchVO [mBoardNo=" + mBoardNo + ", deptNo=" + deptNo + ", toString()=" + super.toString()
				+ "]";
	}
	

	
	
	
	
	
	
	
	
}
