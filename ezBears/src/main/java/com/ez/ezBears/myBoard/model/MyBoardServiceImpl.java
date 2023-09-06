package com.ez.ezBears.myBoard.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MyBoardServiceImpl implements MyBoardService {
	private final MyBoardDAO myBoardDao;

	//메인 보드 번호 찾기
	@Override
	public int selectMainMboardNo(int memNo) {
		return myBoardDao.selectMainMboardNo(memNo);
	}

	
}
