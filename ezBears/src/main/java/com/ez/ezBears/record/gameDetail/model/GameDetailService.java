package com.ez.ezBears.record.gameDetail.model;

public interface GameDetailService {
	int insertGameDetail(GameDetailVO gameDetailVo);
	GameDetailVO selectByRecodeNo(int recodeNo);
}
