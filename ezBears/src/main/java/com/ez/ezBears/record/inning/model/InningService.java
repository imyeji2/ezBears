package com.ez.ezBears.record.inning.model;

import java.util.List;
import java.util.Map;

public interface InningService {
	int insertInning(InningVO inningVo);
	int updateInning(InningVO inningVo);
	int deleteInning(int inningNo);
	List<Map <String, Object>> selectInningView(int recodeNo);
	List<Map<String, Object>> selectInningHomeView(int recodeNo);
	List<Map<String, Object>>  selectInningAwayView(int recodeNo);
}
