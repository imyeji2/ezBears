package com.ez.ezBears.member.model;

public interface MemberService {
<<<<<<< HEAD
	//아이디 중복확인 관련 상수
	int EXIST_ID=1;  //이미 해당 아이디가 존재함
	int NONE_EXIST_ID=2; //아이디 존재하지 않음 => 사용가능
	
	//로그인 처리 관련 상수
	int LOGIN_OK=1;  //로그인 성공
	int PWD_DISAGREE=2; //비밀번호 불일치
	int USERID_NONE=3; //해당 아이디가 존재하지 않음
	
	int selectCheckId(String MEM_ID);
	int loginCheck(String MEM_ID, String MEM_PWD);
=======
	String createId(String memId);
>>>>>>> branch 'main' of https://github.com/GunwooRoh/FinalProject.git
}
