
package com.ez.ezBears.myBoard.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ez.ezBears.member.model.MemberVO;

@Mapper
public interface MyBoardListDAO {
	//예지
	//마이보드 메뉴 출력
	List<Map<String, Object>> selectBoardList(String userid);
	
	//마이보드 탭 
	String selectByMyBoardName(MyBoardListVO myBoardListVo);
	
	//마이보드 정보
	MyBoardListVO selectMyBoardInfo(MyBoardListVO myBoardListVo);
	
	//마이보드 이름
	String selectByBoardName(int myBoardNo);
	
	//댓글 동록 마이보드 번호 찾기
	int seleectMyBoardNo(MyBoardListVO myBoardListVo);
	
	//마이보드 멤버 검색
	List<Map<String, Object>>selectMyBoardMember(int mBoardNo);
	
	//마이보드 변경 업데이트
	int deleteMainBoard(int memNo);//기존 보드 삭제
	int updateMainBoard(MyBoardVO myBoardVo);//새로운 보드 업데이트


	
	//다희
	//부서 이름으로 동적 게시판 번호 찾기
	int findBoardNoByBoardName(String MBoardName);
	
	//내 동적 게시판에 부서 번호로 게시판 등록
	int insertMyBoard(MyBoardListVO myBoardListVo);
	
	//내가 관리자인 보드 리스트 찾기
	List<Map<String, Object>> selectAdminBoardList(int adminMem);
	
	//마이 보드 삭제
	int deleteMyboard(int mBoardNo);
	
	//
	int updateMyboard(int mBoardNo);
	
	//마이보드 멤버 수 
	int totalCountMboardMember(int mBoardNo);
	
	
	
	//희진
	/* List<Map<String, Object>> selectBoardInfo(String userid); */
	MyBoardInfoVO selectBoardInfo(MyBoardInfoVO myBoardInfoVo);
	
	
	MyBoardInfoVO selectMyBoardDept(String userid);
	
	MyBoardInfoVO selectMemAppPositionInfo(int mBoardNo);
	
	List<Map<String, Object>> selectMyBoardMember2(int mBoardNo);
}
