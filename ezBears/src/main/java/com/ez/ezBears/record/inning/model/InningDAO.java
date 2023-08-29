package com.ez.ezBears.record.inning.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ez.ezBears.common.SearchVO;

@Mapper
public interface InningDAO {
	int insertInning(InningVO inningVo);
	int updateInning(InningVO inningVo);
	int deleteInning(int inningNo);
	
	List<Map <String, Object>> selectByrecodeDetailNo(int recodeDetailNo);
}
