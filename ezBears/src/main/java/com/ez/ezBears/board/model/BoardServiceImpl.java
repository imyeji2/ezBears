package com.ez.ezBears.board.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ez.ezBears.common.MyBoardSearchVo;
import com.ez.ezBears.common.SearchVO;
import com.ez.ezBears.notice.model.NoticeServiceImpl;
import com.ez.ezBears.temNotice.model.TeamNoticeVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{
	private static final Logger logger = LoggerFactory.getLogger(NoticeServiceImpl.class);
	private final BoardDAO boardDao;
	
	@Override
	public List<Map<String, Object>> selectAllBoard(MyBoardSearchVo searchVo) {
		return boardDao.selectAllBoard(searchVo);
	}

	@Override
	public int selectTotalCount(SearchVO serarchVo) {
		return boardDao.selectTotalCount(serarchVo);
	}

	@Override
	public int insertBoard(BoardVO boardVo) {
		return boardDao.insertBoard(boardVo);
	}

	@Override
	public int randomNum(int randomNo) {
		return boardDao.randomNum(randomNo);
	}

	@Override
	public List<Map<String, Object>> boardAll() {
		return boardDao.boardAll();
	}

	@Override
	public int checkExistingRandomId(String randomId) {
	    return boardDao.checkExistingRandomId(randomId);
	}

	@Override
	public int insertFileBoard(List<Map<String, Object>> files, int boardNo) {
		int cnt = 0;
		logger.info("files={},files.size={}",files,files.size());
		
		if(files != null || !files.isEmpty()) {
			for(Map<String, Object> map : files) {
				BoardFileVO vo = new BoardFileVO();
				
				vo.setBoardNo(boardNo);
				vo.setFileName((String) map.get("fileName"));
				vo.setOriginFileName((String) map.get("originalFileName"));
				vo.setFileSize((long) map.get("fileSize"));
				
				cnt = boardDao.insertFileBoard(vo);
				logger.info("파일 db 입력 결과 cnt={}", cnt);
			}
		}
		
		return cnt;
	}

	@Override
	public int updateDowncount(int boardFileNo) {
		return boardDao.updateDowncount(boardFileNo);
	}

	@Override
	public List<Map<String, Object>> nextPage(int boardNo) {
		return boardDao.nextPage(boardNo);
	}

	@Override
	public Map<String, Object> selectDetail(int boardNo) {
		int cnt = boardDao.updateViewsCount(boardNo);
		logger.info("조회수 증가 결과 cnt={}",cnt);
		
		return boardDao.selectDetail(boardNo);
	}

	@Override
	public List<Map<String, Object>> selectBoardList(int boardNo) {
		return boardDao.selectBoardList(boardNo);
	}

	@Override
	public List<Map<String, Object>> selectBoardFile(int boardNo) {
		return boardDao.selectBoardFile(boardNo);
	}

	@Override
	public void deleteBoardFile(int boardNo) {
		boardDao.deleteBoardFile(boardNo);
	}

	@Override
	public int deleteBoard(int boardNo) {
		return boardDao.deleteBoard(boardNo);
	}

	@Override
	public List<Map<String, Object>> selectboardFileByNo(int boardNo) {
		return boardDao.selectboardFileByNo(boardNo);
	}

	@Override
	public int updateboard(BoardVO boardVo) {
		return boardDao.updateboard(boardVo);
	}


	@Override
	public List<Map<String, Object>> selectReply(MyBoardSearchVo searchVo) {
		return boardDao.selectReply(searchVo);
	}

	@Override
	public int selectReplyTotalCount(int groupNo) {
		return boardDao.selectReplyTotalCount(groupNo);
	}

	@Override
	public List<Map<String, Object>> boardWriteAll() {
		return boardDao.boardWriteAll();
	}

	@Override
	public int checkExistingWriteId(String randomWrite) {
		return boardDao.checkExistingWriteId(randomWrite);
	}

	@Override
	public BoardVO selectReplyBoardNo(int boardNo) {
		return boardDao.selectReplyBoardNo(boardNo);
	}

	@Override
	public int updeteReply(BoardVO boardVo) {
		return boardDao.updeteReply(boardVo);
	}

	@Override
	public int deleteReply(int boardNo) {
		return boardDao.deleteReply(boardNo);
	}

	@Override
	public int ReReply(BoardVO boardVo) {
		int cnt = boardDao.updateSortNo(boardVo);
		boardVo.setGroupno(boardDao.selectGroupNo());
		cnt = boardDao.insertBoardReReply(boardVo);
		
		return cnt;
	}
	
	@Override
	public int Reply(BoardVO boardVo) {
		int cnt = boardDao.updateSortNo(boardVo);
		boardVo.setGroupno(boardDao.selectGroupNo());
		cnt = boardDao.insertReply(boardVo);
		
		return cnt;
	}


}
