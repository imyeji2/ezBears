package com.ez.ezBears.record.gameDetail.model;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface GameDetailDAO {
	int insertGameDetail(GameDetailVO gameDetailVo);
	
	Map<String, Object> selectByRecodeNo(int recodeNo);
}
