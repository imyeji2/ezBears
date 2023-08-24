package com.ez.ezBears.record.pitcher.model;

import java.util.List;
import java.util.Map;

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
	public int updatePitcher(PitcherVO pitcherVo) {
		return pitcherDao.updatePitcher(pitcherVo);
	}
	
	@Override
	public int deletePitcher(PitcherVO pitcherVo) {
		return pitcherDao.deletePitcher(pitcherVo);
	}

	@Override
	public List<PitcherVO> selectPitcherByPlayerNo(int playerNo) {
	    return pitcherDao.selectPitcherByPlayerNo(playerNo);
	}

	@Override
	public Map<String, Object> selectByPlayerNo(int playerNo, String playDate) {
		return pitcherDao.selectByPlayerNo(playerNo, playDate);
	}
	
	
}
