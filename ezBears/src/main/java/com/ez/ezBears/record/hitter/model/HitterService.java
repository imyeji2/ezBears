package com.ez.ezBears.record.hitter.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HitterService {
	int insertHitter(HitterVO pitcherVo);

	HitterVO getHitterByPlayerNo(int playerNo);

}
