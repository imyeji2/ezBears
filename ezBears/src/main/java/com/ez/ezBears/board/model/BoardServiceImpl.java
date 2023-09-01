package com.ez.ezBears.board.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ez.ezBears.common.SearchVO;
import com.ez.ezBears.notice.model.NoticeServiceImpl;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService{
	private static final Logger logger = LoggerFactory.getLogger(NoticeServiceImpl.class);
	private final BoardDAO boardDao;
	
	@Override
	public List<Map<String, Object>> selectAllBoard(SearchVO searchVo) {
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

}
