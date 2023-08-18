package com.ez.ezBears.temNotice.model;

import java.util.List;
import java.util.Map;

public interface TeamNoticeService {
	int insertTeamNotice(TeamNoticeVO teamNoticeVo);
	List<Map<String, Object>> selectTeamNoticeList(int myBoardNo);
}
