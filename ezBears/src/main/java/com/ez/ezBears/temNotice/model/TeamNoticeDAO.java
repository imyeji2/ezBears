package com.ez.ezBears.temNotice.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ez.ezBears.common.MyBoardSearchVo;

@Mapper
public interface TeamNoticeDAO {
	int insertTeamNotice(TeamNoticeVO teamNoticeVo);
	List<Map<String, Object>> selectTeamNoticeList(MyBoardSearchVo searchVo);

}
