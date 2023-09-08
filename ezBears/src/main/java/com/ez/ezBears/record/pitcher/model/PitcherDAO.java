package com.ez.ezBears.record.pitcher.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ez.ezBears.team.model.TeamVO;

@Mapper
public interface PitcherDAO {
	int insertPitcher(PitcherVO pitcherVo);
	int updatePitcher(PitcherVO pitcherVo);
	int deletePitcher(int pitcherNo);
	PitcherVO selectPitcherByPlayerNo(int playerNo);
	List<Map<String, Object>> selectPitcherView(int playerNo);
	List<Map<String, Object>> selectPitcherRecordView(int recordNo);
	PitcherVO selectByRecodeNo(int recodeNo);
	
	
	//투수 전체조회
	List<TeamVO> selectAllPitcher();
}
