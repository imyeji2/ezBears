package com.ez.ezBears.record.inning.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ez.ezBears.common.SearchVO;

@Mapper
public interface InningDAO {
	int insertInning(InningVO inningVo);
	int updateInning(InningVO inningVo);
	int deleteInning(int inningNo);
	
	List<InningVO> selectByrecodeDetailNo(SearchVO searchVo, int recodeDetailNo);
}
