package com.ez.ezBears.notice.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService{
	private final NoticeDAO noticeDao;
	
	@Override
	public int insertNotice(NoticeVO noticeVo) {
		return noticeDao.insertNotice(noticeVo);
	}

	@Override
	public List<Map<String, Object>> selectNoticeList(int noticeNo) {
		return noticeDao.selectNoticeList(noticeNo);
	}

}
