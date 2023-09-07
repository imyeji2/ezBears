package com.ez.ezBears.staff.model;

import java.util.List;
import java.util.Map;

import com.ez.ezBears.common.SearchVO;

public interface StaffService {
	//아이디 중복확인 관련 상수
	int EXIST_ID=1;  //이미 해당 아이디가 존재함
	int NONE_EXIST_ID=2; //아이디 존재하지 않음 => 사용가능
	
	//로그인 처리 관련 상수
	int LOGIN_OK=1;  //로그인 성공
	int PWD_DISAGREE=2; //비밀번호 불일치
	int USERID_NONE=3; //해당 아이디가 존재하지 않음
	
	int USERID_DONE=4; //스태프계약 상태 N
	
	int selectCheckId(String staffId);
	int loginCheck(String staffId, String staffPwd);
	int insertStaff(StaffVO staffVo);
	StaffVO getStaffById(String staffId);
	List<StaffVO> selectAllStaff(SearchVO searchVo);
	int getTotalRecord(SearchVO searchVo);
	StaffVO selectByStaffNo(int staffNo);

	Map<String, Object> selectStaffView(String staffId);
	int updateStaff(StaffVO staffVo);
	int deleteStaff(int staffNo);
	
	String getStaffId();
	
	int selectCntStaff();
	
	int selectStaffNo(String staffId);
	StaffVO selectByUserid(String staffId);
	int updateMypage(StaffVO staffVo);
	int updatePwd(StaffVO staffVo);
}
