package com.ez.ezBears.record.hitter.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HitterDAO {
	int insertHitter(HitterVO hitterVo);
	HitterVO selectByPlayerNo(int playerNo);
	int updateHitter(HitterVO hitterVo);
	int deleteHitter(int hitterNo);
	List<Map<String, Object>> selectHitterView(int playerNo);
	Map<String, Object> selectHitterStatView(int playerNo);
	List<Map<String, Object>> selectHitterRecordView(int recodeNo);

}
