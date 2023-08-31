package com.ez.ezBears.sign.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SignServiceImpl implements SignService{

	private final SignDAO signDao;

	
	// 결재 등록
	@Override
	public int insertApproval(SignVO signVo) {
		return signDao.insertApproval(signVo);
	}
	
	
}
