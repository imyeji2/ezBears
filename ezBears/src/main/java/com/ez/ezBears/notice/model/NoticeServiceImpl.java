package com.ez.ezBears.notice.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ez.ezBears.common.SearchVO;
import com.ez.ezBears.notice.controller.NoticeController;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService{
	private static final Logger logger = LoggerFactory.getLogger(NoticeServiceImpl.class);
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
		logger.info("조회수 증가 결과 cnt={}",cnt);
		
		return noticeDao.selectDetail(noticeNo);
	}

	@Override
	public List<Map<String, Object>> selectNoticeFile(int noticeNo) {
		return noticeDao.selectNoticeFile(noticeNo);
	}
	
	@Override
	public int insertFileNotice(List<Map<String, Object>> files, int noticeNo) {
		int cnt = 0;
		logger.info("files={},files.size={}",files,files.size());
		
		if(files != null || !files.isEmpty()) {
			for(Map<String, Object> map : files) {
				NoticeFileVO vo = new NoticeFileVO();
				
				vo.setNoticeNo(noticeNo);
				vo.setFileName((String) map.get("fileName"));
				vo.setOriginFileName((String) map.get("originalFileName"));
				vo.setFileSize((long) map.get("fileSize"));
				
				cnt = noticeDao.insertFileNotice(vo);
				logger.info("파일 db 입력 결과 cnt={}", cnt);
			}
		}
		
		return cnt;
	}

	/*
	 * @Override public List<Map<String, Object>> nextPage(int noticeNo) { return
	 * noticeDao.nextPage(noticeNo); }
	 */

	/*
	 * @Override public List<Map<String, Object>> backPage(int noticeNo) { return
	 * noticeDao.backPage(noticeNo); }
	 */

	@Override
	public List<Map<String, Object>> nextPage(int noticeNo) {
		return noticeDao.nextPage(noticeNo);
	}

	@Override
	public int updateNotice(NoticeVO noticeVo) {
		return noticeDao.updateNotice(noticeVo);
	}

	@Override
	public void deleteNoticeFile(int noticeNo) {
		noticeDao.deleteNoticeFile(noticeNo);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		return noticeDao.deleteNotice(noticeNo);
	}

	@Override
	public NoticeVO selectnoticeByNo(int noticeNo) {
		return noticeDao.selectnoticeByNo(noticeNo);
	}

	@Override
	public List<Map<String, Object>> selectnoticeFileByNo(int noticeNo) {
		return noticeDao.selectnoticeFileByNo(noticeNo);
	}

	@Override
	public int updateDowncount(int noticeFileNo) {
		return noticeDao.updateDowncount(noticeFileNo);
	}

	@Override
	public List<Map<String, Object>> selectAllNotice(SearchVO searchVo) {
		return noticeDao.selectAllNotice(searchVo);
	}

	@Override
	public int selectTotalCount(SearchVO searchVo) {
		return noticeDao.selectTotalCount(searchVo);
	}

	
}
