package com.ez.ezBears.record.game.model;

import org.springframework.stereotype.Service;

import com.ez.ezBears.common.SearchVO;

import lombok.RequiredArgsConstructor;

import java.util.List;

@Service
@RequiredArgsConstructor
public class GameServiceImpl implements GameService {
	private final GameDAO gameDao;
	
	@Override
	public int insertGame(GameVO gameVo) {
		return gameDao.insertGame(gameVo);
	}
	
	@Override
	public int deleteGame(int recodeNo) {
		return gameDao.deleteGame(recodeNo);
	}

	@Override
	public int updateGame(GameVO gameVo) {
		return gameDao.updateGame(gameVo);
	}

	@Override
	public List<GameVO> selectAllGame(SearchVO searchVo) {
		return gameDao.selectAllGame(searchVo);
	}

	@Override
	public GameVO selectByRecodeNo(int recodeNo) {
		// TODO Auto-generated method stub
		return gameDao.selectByRecodeNo(recodeNo);
	}
	
	
}
