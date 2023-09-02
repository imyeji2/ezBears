package com.ez.ezBears.sign.model;

import java.util.List;
import java.util.Map;

import com.ez.ezBears.common.SearchVO;

public interface SignService {

	//결재등록
	int insertApproval(SignVO signVo);
	
	// 전체 리스트
	List<Map<String, Object>> selectApprovalList(SearchVO searchVo);
	
	//total레코드
	int selectAppCount(SearchVO searchVo);
	
	Map<String, Object> detailSign(int docNo);
}
