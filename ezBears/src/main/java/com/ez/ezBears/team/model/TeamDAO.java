package com.ez.ezBears.team.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TeamDAO {
	int insertTeam(TeamVO teamVo);
}
