package com.ez.ezBears.record.pitcher.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PitcherDAO {
	int insertPitcher(PitcherVO pitcherVo);
	PitcherVO selectByPlayerNo(int playerNo);

}
