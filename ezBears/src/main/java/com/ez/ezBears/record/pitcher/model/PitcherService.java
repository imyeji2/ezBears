package com.ez.ezBears.record.pitcher.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PitcherService {
	int insertPitcher(PitcherVO pitcherVo);

	PitcherVO getPitcherByPlayerNo(int playerNo);

}
