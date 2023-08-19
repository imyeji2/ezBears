package com.ez.ezBears.notice.model;

import java.util.List;
import java.util.Map;

public interface NoticeService {
	int insertNotice(NoticeVO noticeVo);
	List<Map<String, Object>> selectNoticeList(int noticeNo);
}
