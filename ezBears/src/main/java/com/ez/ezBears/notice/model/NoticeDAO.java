package com.ez.ezBears.notice.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface NoticeDAO {
	int insertNotice(NoticeVO noticeVo);
	List<Map<String, Object>> selectNoticeList(int noticeNo);
	Map<String, Object> selectDetail(int noticeNo);
	int updateViewsCount(int noticeNo);
}
