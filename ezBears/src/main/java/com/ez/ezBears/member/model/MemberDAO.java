package com.ez.ezBears.member.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDAO {
	int selectCheckId(String memId);
	String selectPwd(String memId);
	
	//자동 아이디 생성 관리 
    int getTodayMem(String contractStart);
    int isMemId(String memId);
    
    //멤버 등록
    int insertMem(MemberVO memberVo);
}
