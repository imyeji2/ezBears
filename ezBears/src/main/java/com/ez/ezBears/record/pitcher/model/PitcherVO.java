package com.ez.ezBears.record.pitcher.model;

import lombok.Data;

@Data
public class PitcherVO {
	private int pitcherRecordNo;
	private int recodeNo;
	private int playerNo;
	private double BB;
	private int SO;
	private int IP;
	private int HA;
	private int RC;
	private int ER;
	private int HR;
	private double ERA;
}
