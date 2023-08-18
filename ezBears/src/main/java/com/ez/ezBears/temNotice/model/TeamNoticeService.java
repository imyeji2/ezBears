package com.ez.ezBears.temNotice.model;

import java.util.List;
import java.util.Map;

import com.ez.ezBears.common.MyBoardSearchVo;

public interface TeamNoticeService {
	int insertTeamNotice(TeamNoticeVO teamNoticeVo);
	List<Map<String, Object>> selectTeamNoticeList(MyBoardSearchVo searchVo);
}
