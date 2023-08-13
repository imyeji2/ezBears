package com.ez.ezBears.member.model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{
	private final MemberDAO memberDao;
	private int todayMem = 0; // 등록된 사원 수 유지하려고 전역에 선언
	
	@Override
	public int selectCheckId(String memId) {
		int count = memberDao.selectCheckId(memId);

		int result=0;
		if(count>0) {
			result = MemberService.EXIST_ID;			
		}else {
			result = MemberService.NONE_EXIST_ID;			
		}

		return result;
	}

	@Override
	public int loginCheck(String memId, String memPwd) {
		String dbPwd=memberDao.selectPwd(memId);

		int result=0;
		if(dbPwd==null || dbPwd.isEmpty()) {
			result=MemberService.USERID_NONE;
		}else {
			if(dbPwd.equals(memPwd)) {
				result=MemberService.LOGIN_OK;				
			}else {
				result=MemberService.PWD_DISAGREE;
			}
		}

		return result;
	}

	@Override
	public String createMemId() {
		
		//오늘 날짜
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String today = sdf.format(new Date());
		
		//오늘 생성된 사원 수 증가
		todayMem++;
		
		String memberId = "ez_fr_" + today + String.format("%03d", todayMem);
		
		return memberId;
	}
}
