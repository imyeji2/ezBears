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

	@Override
	public Map<String, Object> selectDetail(int noticeNo) {
		int cnt = noticeDao.updateViewsCount(noticeNo);
		
		return noticeDao.selectDetail(noticeNo);
	}

	@Override
	public int insertFileNotice(List<Map<String, Object>> files, int noticeNo) {
		int cnt = 0;
		
		if(files != null && !files.isEmpty()) {
			for(Map<String, Object> map : files) {
				NoticeFileVO vo = new NoticeFileVO();
				
				vo.setNoticeNo(noticeNo);
				vo.setFileName((String) map.get("fileName"));
				vo.setOriginFileName((String) map.get("originalFileName"));
				vo.setFileSize((long) map.get("fileSize"));
				
				cnt += noticeDao.insertFileNotice(vo);
			}
		}
		
		return cnt;
	}
}
