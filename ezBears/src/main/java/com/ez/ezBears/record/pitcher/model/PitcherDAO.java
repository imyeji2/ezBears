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
	int deletePitcher(int recodeNo, int playerNo);
	
	PitcherVO selectByRecodeNo(int recodeNo);
	PitcherVO selectPitcherByPlayerNo(int playerNo);
	PitcherVO selectByPlayerNo(int playerNo);
	
	List<Map<String, Object>> selectPitcherView(int playerNo);
	List<Map<String, Object>> selectPitcherRecordView(int recordNo);
	
	//투수 전체조회
	List<TeamVO> selectAllPitcher();
	
	List<Map<String, Object>> selectPitcherStatView(int playerNo);
	List<Map<String, Object>> selectAllPitcherStat();
}
