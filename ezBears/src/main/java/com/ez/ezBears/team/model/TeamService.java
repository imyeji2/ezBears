package com.ez.ezBears.team.model;

import java.util.List;
import java.util.Map;

public interface TeamService {
	int insertTeam(TeamVO teamVo);
	List<Map<String, Object>> selectAllTeam();
	int getTotalRecord();
}
