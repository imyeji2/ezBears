package com.ez.ezBears.record.hitter.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HitterDAO {
	int insertHitter(HitterVO hitterVo);
	HitterVO selectByPlayerNo(int playerNo);
	int editHitter(HitterVO hitterVo);
}
