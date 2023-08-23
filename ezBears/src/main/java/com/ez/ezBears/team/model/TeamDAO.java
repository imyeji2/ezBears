package com.ez.ezBears.team.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ez.ezBears.common.SearchVO;

@Mapper
public interface TeamDAO {
	int insertTeam(TeamVO teamVo);
	List<Map<String, Object>> selectAllTeam(SearchVO searchVo);
	int getTotalRecord(SearchVO searchVo);
	Map<String, Object> selectByPlayerNo(int playerNo);
	int updateTeam(TeamVO teamVo);
	int deleteTeam(int playerNo);
}
