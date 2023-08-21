package com.ez.ezBears.record.pitcher.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PitcherServiceImpl implements PitcherService {
	private final PitcherDAO pitcherDao;
	
	@Override
	public int insertPitcher(PitcherVO pitcherVo) {
		return pitcherDao.insertPitcher(pitcherVo);
	}

	@Override
	public PitcherVO getPitcherByPlayerNo(int playerNo) {
		return pitcherDao.selectByPlayerNo(playerNo);
	}

}
