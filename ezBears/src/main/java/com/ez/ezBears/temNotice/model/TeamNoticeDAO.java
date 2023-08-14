package com.ez.ezBears.temNotice.model;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TeamNoticeDAO {
	int insertTeamNotice(TeamNoticeVO teamNoticeVo);

}
