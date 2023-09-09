package com.ez.ezBears.record.hitter.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ez.ezBears.team.model.TeamVO;

@Mapper
public interface HitterDAO {
	int insertHitter(HitterVO hitterVo);
	int updateHitter(HitterVO hitterVo);
	int deleteHitter(@Param("recodeNo")int recodeNo,@Param("playerNo") int playerNo);
	
	HitterVO selectByPlayerNo(int playerNo);
	HitterVO selectByRecodeNo(int recodeNo);
	
	List<TeamVO> selectAllHitter();
	List<Map<String, Object>> selectHitterView(int playerNo);
	List<Map<String, Object>> selectHitterRecordView(int recodeNo);
	
	List<Map<String, Object>> selectHitterStatView(int playerNo);
	
}
