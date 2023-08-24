package com.ez.ezBears.MBoard.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MBoardServiceImpl implements MBoardService{

	private final MBoardDAO mBoardDao;
	@Override
	public int checkSameName(String mBoardName) {
		return mBoardDao.checkSameName(mBoardName);
	}

	@Override
	public int insertMBoard(MBoardVO mBoardVo) {
		return mBoardDao.insertMBoard(mBoardVo);
	}

}
