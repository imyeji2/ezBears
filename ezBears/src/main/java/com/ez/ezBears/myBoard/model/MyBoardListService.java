package com.ez.ezBears.myBoard.model;

import java.util.List;
import java.util.Map;

public interface MyBoardListService {
	List<Map<String, Object>> selectBoardList(int memNo);
}
