package com.ez.ezBears.staff.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StaffDAO {
	int selectCheckId(String STAFF_ID);
	String selectPwd(String STAFF_ID);
}
