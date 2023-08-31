package com.ez.ezBears.sign.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SignDAO {

	//결재 등록
	int insertApproval(SignVO signVo);
	
}
