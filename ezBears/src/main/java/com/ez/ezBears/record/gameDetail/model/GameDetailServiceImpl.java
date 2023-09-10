package com.ez.ezBears.record.gameDetail.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class GameDetailServiceImpl implements GameDetailService {
	private final GameDetailDAO gameDetailDao;

	@Override
	public int insertGameDetail(GameDetailVO gameDetailVo) {
		// TODO Auto-generated method stub
		return gameDetailDao.insertGameDetail(gameDetailVo);
	}

	@Override
	public GameDetailVO selectByRecodeNo(int recodeNo) {
		// TODO Auto-generated method stub
		return gameDetailDao.selectByRecodeNo(recodeNo);
	}
	
	
}
