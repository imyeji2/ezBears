package com.ez.ezBears.member.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{
	private final MemberDAO memberDao;
	
	@Override
	public int selectCheckId(String MEM_ID) {
		int count = memberDao.selectCheckId(MEM_ID);

		int result=0;
		if(count>0) {
			result = MemberService.EXIST_ID;			
		}else {
			result = MemberService.NONE_EXIST_ID;			
		}

		return result;
	}

	@Override
	public int loginCheck(String MEM_ID, String MEM_PWD) {
		String dbPwd=memberDao.selectPwd(MEM_ID);

		int result=0;
		if(dbPwd==null || dbPwd.isEmpty()) {
			result=MemberService.USERID_NONE;
		}else {
			if(dbPwd.equals(MEM_PWD)) {
				result=MemberService.LOGIN_OK;				
			}else {
				result=MemberService.PWD_DISAGREE;
			}
		}

		return result;
	}
}
