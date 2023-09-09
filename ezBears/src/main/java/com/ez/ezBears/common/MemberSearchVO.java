package com.ez.ezBears.common;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberSearchVO extends SearchVO{
	private int memNo;
	private int deptNo;

	@Override
	public String toString() {
		return "MemberSearchVO [memNo=" + memNo + ", toString()=" + super.toString() + "]";
	}
	
	
}
