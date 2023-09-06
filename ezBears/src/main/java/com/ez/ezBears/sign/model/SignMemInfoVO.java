package com.ez.ezBears.sign.model;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SignMemInfoVO extends SignVO {

	private int mBoardNo;
	private int positionNo;
	
	@Override
	public String toString() {
		return "SignMemInfoVO [mBoardNo=" + mBoardNo + "]";
	}
	
	
	
}
