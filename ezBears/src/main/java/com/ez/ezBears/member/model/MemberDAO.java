package com.ez.ezBears.member.model;

<<<<<<< HEAD
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDAO {
	int selectCheckId(String MEM_ID);
	String selectPwd(String MEM_ID);
=======
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDAO {
	int selectChkId(String memId);
>>>>>>> branch 'main' of https://github.com/GunwooRoh/FinalProject.git
}
