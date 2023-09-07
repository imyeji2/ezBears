package com.ez.ezBears.MBoard.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ez.ezBears.common.SearchVO;

@Mapper
public interface MBoardDAO {
	
	//부서에서 동명의 보드가 있는지 찾기
	int checkSameName(String mBoardName);
	// 부서 등록시 자동으로 보드 등록
	int insertMBoard(MBoardVO mBoardVo);
	
	//전체 게시판 가지고오기
	List<MBoardVO> selectAllboard(SearchVO searchVo);
	
	//전체 게시판 개수
	int totalBoardList(SearchVO searchVo);
	
	//예지
	//마이보드 추가 등록
	int addMboard(MBoardVO mBoardVo);
	
	//보드 리스트 정보 업데이트
	int updateMboard(MBoardVO mBoardVo);
	
	//보드 삭제
	int deleteMboard(int mBoardNo);
	//관리자 삭제
	int updateMboardDelAdmin(int mBoardNo);
	
	//보드 이름 검색
	String selectMboardName(int mBoardNo);
	
	//보드 관리자 검색
	MBoardVO selectMboardAdminNo(int mBoardNo);
	

}
