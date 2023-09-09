package com.ez.ezBears.record.game.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ez.ezBears.common.SearchVO;

@Mapper
public interface GameDAO {
	int insertGame(GameVO gameVo);
	int updateGame(GameVO gameVo);
	int deleteGame(int recodeNo);
	List<GameVO> selectAllGame(SearchVO searchVo);
	GameVO selectByRecodeNo(int recodeNo);
	List<GameVO> selectAllGameMain();
	List<Map<String, Object>> selectMonthlyWinRate();
}
