package com.ez.ezBears.common;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MyBoardSearchVo extends SearchVO{
	private int mBoardNo;

	@Override
	public String toString() {
		return "MyBoardSearchVo [mBoardNo=" + mBoardNo + ", toString()=" + super.toString() + "]";
	} 
}


