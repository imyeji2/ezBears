package com.ez.ezBears.notice.model;

import java.util.List;
import java.util.Map;

public interface NoticeService {
	int insertNotice(NoticeVO noticeVo);
	int insertFileNotice(List<Map<String, Object>> files, int noticeNo);
	List<Map<String, Object>> selectNoticeList(int noticeNo);
	Map<String, Object> selectDetail(int noticeNo);
	List<Map<String, Object>> selectNoticeFile(int noticeNo);
	//List<Map<String, Object>> nextPage(int noticeNo);
	List<Map<String, Object>> nextPage(int noticeNo);
	//List<Map<String, Object>> backPage(int noticeNo);
	
	int updateNotice(NoticeVO noticeVo);
	void deleteNoticeFile(int noticeNo);
}
