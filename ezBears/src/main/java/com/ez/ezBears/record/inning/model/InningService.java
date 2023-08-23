package com.ez.ezBears.record.inning.model;

import java.util.List;

import com.ez.ezBears.common.SearchVO;

public interface InningService {
	int insertInning(InningVO inningVo);
	int updateInning(InningVO inningVo);
	int deleteInning(int inningNo);
	List<InningVO> selectByrecodeDetailNo(SearchVO searchVO, int recodeDetailNo);
}
