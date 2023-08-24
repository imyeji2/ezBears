package com.ez.ezBears.notice.model;

import java.util.List;
import java.util.Map;

public interface NoticeService {
	int insertNotice(NoticeVO noticeVo);
	int insertFileNotice(List<Map<String, Object>> files, int noticeNo);
	List<Map<String, Object>> selectNoticeList(int noticeNo);
	Map<String, Object> selectDetail(int noticeNo);
}
