package com.ez.ezBears.record.pitcher.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface PitcherDAO {
	int insertPitcher(PitcherVO pitcherVo);
	int updatePitcher(PitcherVO pitcherVo);
	int deletePitcher(PitcherVO pitcherVo);
	List<PitcherVO> selectPitcherByPlayerNo(int playerNo);
	public Map<String, Object> selectByPlayerNo(@Param("playerNo")int playerNo,@Param("playDate")String playDate);
}
