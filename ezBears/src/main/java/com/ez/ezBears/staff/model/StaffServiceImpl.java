package com.ez.ezBears.staff.model;

import org.springframework.stereotype.Service;

import com.ez.ezBears.member.model.MemberService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StaffServiceImpl implements StaffService{
	private final StaffDAO staffDao;

	@Override
	public int selectCheckId(String staffId) {
		int count = staffDao.selectCheckId(staffId);

		int result=0;
		if(count>0) {
			result = MemberService.EXIST_ID;			
		}else {
			result = MemberService.NONE_EXIST_ID;			
		}

		return result;
	}

	@Override
	public int loginCheck(String staffId, String staffPwd) {
		String dbPwd=staffDao.selectPwd(staffId);

		int result=0;
		if(dbPwd==null || dbPwd.isEmpty()) {
			result=MemberService.USERID_NONE;
		}else {
			if(dbPwd.equals(staffPwd)) {
				result=MemberService.LOGIN_OK;				
			}else {
				result=MemberService.PWD_DISAGREE;
			}
		}

		return result;
	}
}
