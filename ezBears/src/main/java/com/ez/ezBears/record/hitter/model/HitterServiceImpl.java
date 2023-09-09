package com.ez.ezBears.record.hitter.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ez.ezBears.team.model.TeamVO;

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
	public int deleteHitter(int recodeNo, int playerNo) {
		return hitterDao.deleteHitter(recodeNo, playerNo);
	}

	@Override
	public List<Map<String, Object>> selectHitterView(int playerNo) {
		return hitterDao.selectHitterView(playerNo);
	}

	@Override
	public List<Map<String, Object>> selectHitterStatView(int playerNo) {
		return hitterDao.selectHitterStatView(playerNo);
	}

	@Override
	public List<Map<String, Object>> selectHitterRecordView(int recodeNo) {
		// TODO Auto-generated method stub
		return hitterDao.selectHitterRecordView(recodeNo);
	}

	@Override
	public List<TeamVO> selectAllHitter() {
		// TODO Auto-generated method stub
		return hitterDao.selectAllHitter();
	}

	@Override
	public HitterVO selectByRecodeNo(int recodeNo) {
		// TODO Auto-generated method stub
		return hitterDao.selectByRecodeNo(recodeNo);
	}

	
}
