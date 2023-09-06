package com.ez.ezBears.notice.model;

import java.util.List;
import java.util.Map;

import com.ez.ezBears.common.SearchVO;

public interface NoticeService {
	int insertNotice(NoticeVO noticeVo);
	int insertFileNotice(List<Map<String, Object>> files, int noticeNo);
	int insertFileNotice1(NoticeFileVO noticeFileVo,int noticeNo);
	NoticeVO selectnoticeByNo(int noticeNo);
	List<Map<String, Object>> selectnoticeFileByNo(int noticeNo);
	
	List<Map<String, Object>> selectNoticeList(int noticeNo);
	
	Map<String, Object> selectDetail(int noticeNo);
	List<Map<String, Object>> selectNoticeFile(int noticeNo);
	//List<Map<String, Object>> nextPage(int noticeNo);
	List<Map<String, Object>> nextPage(int noticeNo);
	//List<Map<String, Object>> backPage(int noticeNo);
	
	int updateNotice(NoticeVO noticeVo);
	int updateNoticeFile(NoticeFileVO noticeFileVo);
	void deleteNoticeFile(int noticeNo);
	int deleteNotice(int noticeNo);
	
	int updateDowncount(int noticeFileNo);
	List<Map<String, Object>> selectAllNotice(SearchVO searchVo);
	int selectTotalCount(SearchVO searchVo);
	
	
	//예지
	//메인 공지사항
	List<Map<String, Object>> selectMainNotice(SearchVO searchVo);
}



