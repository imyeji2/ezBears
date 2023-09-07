package com.ez.ezBears.record.hitter.model;

import lombok.Data;

@Data
public class HitterVO {
	private int hitterNo;
	private int recodeNo;
	private int playerNo;
	private int staffNo;
	private String regdate;
	private int AB;
	private int RS;
	private int H;
	private int RBI;
	private double BB;
	private int SO;
	private double BA;
	private int HR;
}
