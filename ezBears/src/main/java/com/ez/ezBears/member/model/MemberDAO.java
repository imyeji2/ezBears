package com.ez.ezBears.member.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDAO {
	int selectCheckId(String MEM_ID);
	String selectPwd(String MEM_ID);
}
