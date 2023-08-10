package com.ez.ezBears.staff.model;

import org.springframework.stereotype.Service;

<<<<<<< HEAD
import com.ez.ezBears.member.model.MemberService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StaffServiceImpl implements StaffService{
	private final StaffDAO staffDao;

	@Override
	public int selectCheckId(String STAFF_ID) {
		int count = staffDao.selectCheckId(STAFF_ID);

		int result=0;
		if(count>0) {
			result = MemberService.EXIST_ID;			
		}else {
			result = MemberService.NONE_EXIST_ID;			
		}

		return result;
	}

	@Override
	public int loginCheck(String STAFF_ID, String STAFF_PWD) {
		String dbPwd=staffDao.selectPwd(STAFF_ID);

		int result=0;
		if(dbPwd==null || dbPwd.isEmpty()) {
			result=MemberService.USERID_NONE;
		}else {
			if(dbPwd.equals(STAFF_PWD)) {
				result=MemberService.LOGIN_OK;				
			}else {
				result=MemberService.PWD_DISAGREE;
			}
		}

		return result;
	}
=======
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StaffServiceImpl {
	private final StaffDAO staffDao;
>>>>>>> branch 'main' of https://github.com/GunwooRoh/FinalProject.git
}
