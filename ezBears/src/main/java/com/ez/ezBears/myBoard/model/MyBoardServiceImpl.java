package com.ez.ezBears.myBoard.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MyBoardServiceImpl implements MyBoardService {
	private final MyBoardDAO myBoardDao;

	//메인 보드 번호 찾기
	@Override
	public int selectMainMboardNo(int memNo) {
		return myBoardDao.selectMainMboardNo(memNo);
	}
	
	//마이보드 멤버 삭제
	@Override
	public int deleteMyBoardMember(MyBoardVO myBoardVo) {
		return myBoardDao.deleteMyBoardMember(myBoardVo);
	}
	//마이보드 등록
	@Override
	public int insertMyBoard(MyBoardVO myBoardVo) {
		return myBoardDao.insertMyBoard(myBoardVo);
	}

	
}
