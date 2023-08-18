
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

	//부서 이름으로 동적 게시판 번호 찾기
	@Override
	public int findBoardNoByBoardName(String MBoardName) {
		return myBoardListDao.findBoardNoByBoardName(MBoardName);
	}
	
	//내 동적 게시판에 부서 번호로 게시판 등록
	@Override
	public int insertMyBoard(MyBoardListVO myBoardListVo) {
		return myBoardListDao.insertMyBoard(myBoardListVo);
	}

}

