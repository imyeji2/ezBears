package com.ez.ezBears.common;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SignListSearchVO extends SearchVO{

	private int deptNo;
	private int MBoardNo;
	@Override
	public String toString() {
		return "SignListSearchVO [deptNo=" + deptNo + "]";
	}
	
	
}

