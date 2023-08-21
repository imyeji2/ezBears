package com.ez.ezBears.record.hitter.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class HitterServiceImpl implements HitterService {
	private final HitterDAO pitcherDao;

	
	@Override
	public int insertHitter(HitterVO hitterVo) {
		return pitcherDao.insertHitter(hitterVo);
	}

	@Override
	public HitterVO getHitterByPlayerNo(int playerNo) {
		return pitcherDao.selectByPlayerNo(playerNo);
	}

}
