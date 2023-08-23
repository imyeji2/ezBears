package com.ez.ezBears.record.inning.model;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ez.ezBears.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class InningServiceImpl implements InningService {
	private final InningDAO inningDao;

	@Override
	public int insertInning(InningVO inningVo) {
		// TODO Auto-generated method stub
		return inningDao.insertInning(inningVo);
	}

	@Override
	public int updateInning(InningVO inningVo) {
		// TODO Auto-generated method stub
		return inningDao.updateInning(inningVo);
	}

	@Override
	public int deleteInning(int inningNo) {
		// TODO Auto-generated method stub
		return inningDao.deleteInning(inningNo);
	}

	@Override
	public List<InningVO> selectByrecodeDetailNo(SearchVO searchVo, int recodeDetailNo) {
		// TODO Auto-generated method stub
		return inningDao.selectByrecodeDetailNo(searchVo, recodeDetailNo);
	}

	
}
