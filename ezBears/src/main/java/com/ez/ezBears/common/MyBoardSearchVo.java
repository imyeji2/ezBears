package com.ez.ezBears.common;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MyBoardSearchVo extends SearchVO{
	private int mBoardNo;
	private int groupno;

	@Override
	public String toString() {
		return "MyBoardSearchVo [mBoardNo=" + mBoardNo + ",groupno="+groupno+" toString()=" + super.toString() + "]";
	}
}


