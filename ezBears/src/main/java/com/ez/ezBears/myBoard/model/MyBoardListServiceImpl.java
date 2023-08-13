
package com.ez.ezBears.myBoard.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MyBoardListServiceImpl implements MyBoardListService {
	private final MyBoardListDAO myBoardListDao;
	@Override
	public List<Map<String, Object>> selectBoardList(String userid) {
		return myBoardListDao.selectBoardList(userid);
	}
	
	@Override
	public String selectByMyBoardName(int myBoardNo) {
		return myBoardListDao.selectByMyBoardName(myBoardNo);
	}

}

