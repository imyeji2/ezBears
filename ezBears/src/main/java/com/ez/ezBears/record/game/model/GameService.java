package com.ez.ezBears.record.game.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ez.ezBears.common.SearchVO;

public interface GameService {
	int insertGame(GameVO gameVo);
	int updateGame(GameVO gameVo);
	int deleteGame(int recodeNo);
	List<GameVO> selectAllGame(SearchVO searchVo);
}
