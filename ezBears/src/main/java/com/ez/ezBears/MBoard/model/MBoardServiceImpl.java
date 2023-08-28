package com.ez.ezBears.MBoard.model;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ez.ezBears.common.SearchVO;

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

	@Override
	public List<MBoardVO> selectAllboard(SearchVO searchVo) {
		return mBoardDao.selectAllboard(searchVo);
	}

	@Override
	public int totalBoardList(SearchVO searchVo) {
		return mBoardDao.totalBoardList(searchVo);
	}

}
