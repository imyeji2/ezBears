package com.ez.ezBears.record.pitcher.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ez.ezBears.team.model.TeamVO;

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
	public int deletePitcher(int recodeNo, int playerNo) {
		return pitcherDao.deletePitcher(recodeNo, playerNo);
	}

	@Override
	public PitcherVO selectPitcherByPlayerNo(int playerNo) {
		// TODO Auto-generated method stub
		return pitcherDao.selectPitcherByPlayerNo(playerNo);
	}

	@Override
	public List<Map<String, Object>> selectPitcherView(int playerNo) {
		// TODO Auto-generated method stub
		return pitcherDao.selectPitcherView(playerNo);
	}

	@Override
	public List<Map<String, Object>> selectPitcherRecordView(int recordNo) {
		// TODO Auto-generated method stub
		return pitcherDao.selectPitcherRecordView(recordNo);
	}

	@Override
	public List<TeamVO> selectAllPitcher() {
		return pitcherDao.selectAllPitcher();
	}

	@Override
	public PitcherVO selectByRecodeNo(int recodeNo) {
		// TODO Auto-generated method stub
		return pitcherDao.selectByRecodeNo(recodeNo);
	}

	@Override
	public PitcherVO selectByPlayerNo(int playerNo) {
		// TODO Auto-generated method stub
		return pitcherDao.selectByPlayerNo(playerNo);
	}

	@Override
	public List<Map<String, Object>> selectPitcherStatView(int playerNo) {
		// TODO Auto-generated method stub
		return pitcherDao.selectPitcherStatView(playerNo);
	}

	@Override
	public List<Map<String, Object>> selectAllPitcherStat() {
		// TODO Auto-generated method stub
		return pitcherDao.selectAllPitcherStat();
	}
	
	
}
