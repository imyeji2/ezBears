package com.ez.ezBears.board.model;

import lombok.Data;

@Data
public class BoardFileVO {
	private int boardFileNo;
	private int boardNo;
	private String fileName;
	private long fileSize;
	private int downCount;
	private String originFileName;
}
