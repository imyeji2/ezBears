package com.ez.ezBears.record.gameDetail.model;

import java.util.Map;

public interface GameDetailService {
	int insertGameDetail(GameDetailVO gameDetailVo);
	Map<String, Object> selectByRecodeNo(int recodeNo);
}
