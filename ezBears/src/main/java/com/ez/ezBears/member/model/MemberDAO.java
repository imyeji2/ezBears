package com.ez.ezBears.member.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDAO {
	int selectChkId(String memId);
}
