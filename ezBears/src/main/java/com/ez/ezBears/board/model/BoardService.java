package com.ez.ezBears.board.model;

import java.util.List;
import java.util.Map;

import com.ez.ezBears.common.SearchVO;

public interface BoardService {
	List<Map<String, Object>> selectAllBoard(SearchVO searchVo);
	int selectTotalCount(SearchVO serarchVo);
	int insertBoard(BoardVO boardVo);
}
