package com.ez.ezBears.record.hitter.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class HitterServiceImpl implements HitterService {
	private final HitterDAO hitterDao;

	
	@Override
	public int insertHitter(HitterVO hitterVo) {
		return hitterDao.insertHitter(hitterVo);
	}

	@Override
	public HitterVO getHitterByPlayerNo(int playerNo) {
		return hitterDao.selectByPlayerNo(playerNo);
	}

	@Override
	public int updateHitter(HitterVO hitterVo) {
		// TODO Auto-generated method stub
		return hitterDao.updateHitter(hitterVo);
	}

	@Override
	public int deleteHitter(int hitterNo) {
		// TODO Auto-generated method stub
		return hitterDao.deleteHitter(hitterNo);
	}

	@Override
	public List<Map<String, Object>> selectHitterView(int playerNo) {
		return hitterDao.selectHitterView(playerNo);
	}

	@Override
	public Map<String, Object> selectHitterStatView(int playerNo) {
		return hitterDao.selectHitterStatView(playerNo);
	}

	@Override
	public List<Map<String, Object>> selectHitterRecordView(int recodeNo) {
		// TODO Auto-generated method stub
		return hitterDao.selectHitterRecordView(recodeNo);
	}


}
