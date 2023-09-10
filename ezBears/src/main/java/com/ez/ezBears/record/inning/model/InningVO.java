package com.ez.ezBears.record.inning.model;

import lombok.Data;

@Data
public class InningVO {
	private int inningNo;
	private String inning;
	private int H;
	private int errors;
	private int SO;
	private int B2;
	private int B3;
	private int HR;
	private int HRI;
	private int fourBall;
	private int leftOnBase;
	private int AB;
	private int steal;
	private int R;
	private String teamInfo;
	private int recodeDetailNo;
}
