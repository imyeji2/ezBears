package com.ez.ezBears.record.gameDetail.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface GameDetailDAO {
	int insertGameDetail(GameDetailVO gameDetailVo);
	
	GameDetailVO selectByRecodeNo(int recodeNo);
}
