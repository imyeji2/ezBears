package com.ez.ezBears.member.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{
	private final MemberDAO dao;

	@Override
	public String createId(String memId) {
		
		int cnt = dao.selectChkId(memId);
		
		
	}
}
