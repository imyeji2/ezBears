package com.ez.ezBears.record.pitcher.model;

import lombok.Data;

@Data
public class PitcherVO {
	private int pitcherNo;
	private int recodeNo;
	private int playerNo;
	private int staffNo;
	private String regdate;
	private double BB;
	private int SO;
	private int IP;
	private int HA;
	private int RC;
	private int ER;
	private int HR;
	private double ERA;
}
