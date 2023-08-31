package com.ez.ezBears.board.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ez.ezBears.common.SearchVO;

@Mapper
public interface BoardDAO {
	List<Map<String, Object>> selectAllBoard(SearchVO searchVo);
	int selectTotalCount(SearchVO serarchVo);
	int insertBoard(BoardVO boardVo);
}
