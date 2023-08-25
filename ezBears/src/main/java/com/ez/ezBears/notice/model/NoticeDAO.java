package com.ez.ezBears.notice.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeDAO {
	int insertNotice(NoticeVO noticeVo);
	int insertFileNotice(NoticeFileVO noticeFileVo);
	List<Map<String, Object>> selectNoticeList(int noticeNo);
	Map<String, Object> selectDetail(int noticeNo);
	List<Map<String, Object>> selectNoticeFile(int noticeNo);
	int updateViewsCount(int noticeNo);
	
	List<Map<String, Object>> nextPage(int noticeNo);
	//List<Map<String, Object>> backPage(int noticeNo);
	
}
