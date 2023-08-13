
package com.ez.ezBears.myBoard.model;

import java.util.List;
import java.util.Map;

public interface MyBoardListService {
	List<Map<String, Object>> selectBoardList(String userid);
	String selectByMyBoardName(int myBoardNo);
}

