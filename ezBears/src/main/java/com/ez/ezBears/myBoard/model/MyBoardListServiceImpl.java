
package com.ez.ezBears.myBoard.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MyBoardListServiceImpl implements MyBoardListService {
	private final MyBoardListDAO myBoardListDao;
	//예지
	//마이보드 메뉴 출력
	@Override
	public List<Map<String, Object>> selectBoardList(String userid) {
		return myBoardListDao.selectBoardList(userid);
	}
	
	//마이보드 탭 
	@Override
	public String selectByMyBoardName(MyBoardListVO myBoardListVo) {
		return myBoardListDao.selectByMyBoardName(myBoardListVo);
	}
	
	//마이보드 정보
	@Override
	public MyBoardListVO selectMyBoardInfo(MyBoardListVO myBoardListVo) {
		return myBoardListDao.selectMyBoardInfo(myBoardListVo);
	}
	
	//마이보드 이름
	@Override
	public String selectByBoardName(int myBoardNo) {
		return myBoardListDao.selectByBoardName(myBoardNo);
	}

	
	
	//다희
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

