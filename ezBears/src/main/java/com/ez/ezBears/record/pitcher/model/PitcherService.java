package com.ez.ezBears.record.pitcher.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PitcherService {
	int insertPitcher(PitcherVO pitcherVo);
	int updatePitcher(PitcherVO pitcherVo);
	int deletePitcher(PitcherVO pitcherVo);
	List<PitcherVO> selectPitcherByPlayerNo(int playerNo);
	Map<String, Object> selectByPlayerNo(int playerNo, String playDate);
}
