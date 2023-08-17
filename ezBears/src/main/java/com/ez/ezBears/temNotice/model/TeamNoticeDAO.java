package com.ez.ezBears.temNotice.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TeamNoticeDAO {
	int insertTeamNotice(TeamNoticeVO teamNoticeVo);
	List<Map<String, Object>> selectTeamNoticeList(int myBoardNo);

}
