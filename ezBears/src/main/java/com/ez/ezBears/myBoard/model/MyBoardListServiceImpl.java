
package com.ez.ezBears.myBoard.model;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.ez.ezBears.MBoard.model.MBoardDAO;
import com.ez.ezBears.member.model.MemberVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MyBoardListServiceImpl implements MyBoardListService {
	private final MyBoardListDAO myBoardListDao;
	private final MBoardDAO mBoardDao;
	
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

	//댓글 동록 마이보드 번호 찾기
	@Override
	public int seleectMyBoardNo(MyBoardListVO myBoardListVo) {
		return myBoardListDao.seleectMyBoardNo(myBoardListVo);
	}
	
	
	////마이보드 멤버 검색
	@Override
	public List<Map<String, Object>> selectMyBoardMember(int mBoardNo) {
		return myBoardListDao.selectMyBoardMember(mBoardNo);
	}

	
	//내가 관리자인 보드 리스트 찾기
	@Override
	public List<Map<String, Object>> selectAdminBoardList(int adminMem) {
		return myBoardListDao.selectAdminBoardList(adminMem);
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

	/*
	@Override
	public List<Map<String, Object>> selectBoardInfo(String userid) {
		return myBoardListDao.selectBoardInfo(userid);
	}*/
	
	@Override
	public MyBoardInfoVO selectBoardInfo(MyBoardInfoVO myBoardInfoVo) {
		return myBoardListDao.selectBoardInfo(myBoardInfoVo);
	}
	// 결재디테일 부서별 멤버조회
	@Override
	public MyBoardInfoVO selectMyBoardDept(String userid) {
		return myBoardListDao.selectMyBoardDept(userid);
	}

	//마이보드 단순 삭제
	@Override
	public int deleteMyboard(int mBoardNo) {
		return myBoardListDao.deleteMyboard(mBoardNo);
	}

	//보드 삭제 (마이보드, 보드 리스트 같이 삭제)
	@Override
	@Transactional
	public int deleteAdminBoard(int mBoardNo) {
		int cnt=0;
		try {
			 cnt = myBoardListDao.deleteMyboard(mBoardNo);
			 cnt = mBoardDao.deleteMboard(mBoardNo);
			 System.out.println("마이보드 삭제 cnt="+cnt);
		}catch(DataIntegrityViolationException e) {
			e.printStackTrace();
			cnt=myBoardListDao.updateMyboard(mBoardNo);
			cnt=mBoardDao.updateMboardDelAdmin(mBoardNo);
		} catch (Exception e) {
			cnt=-1;
	        TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
	    }
		
		return cnt;
	}
	
	//마이보드 멤버 수 
	@Override
	public int totalCountMboardMember(int mBoardNo) {
		return myBoardListDao.totalCountMboardMember(mBoardNo);
	}

	@Override
	public MyBoardInfoVO selectMemAppPositionInfo(int mBoardNo) {
		return myBoardListDao.selectMemAppPositionInfo(mBoardNo);
	}

	//메인 보드 업데이트 서비스
	@Transactional
	@Override
	public int updateMainBoardService(MyBoardVO myBoardVo) {
		
		int cnt=0;
		
		try {
			cnt = myBoardListDao.deleteMainBoard(myBoardVo.getMemNo());
			cnt = myBoardListDao.updateMainBoard(myBoardVo);
			
		}catch(RuntimeException e) {
			//선언적 트랜젝션(@Transactional)에서는
			//런타임 예외가 발생하면 롤백한다.
			e.printStackTrace();
			cnt=-1;//예외처리를 했다는 의미->예외 발생
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return cnt;
  }
  
	@Override
	public List<Map<String, Object>> selectMyBoardMember2(int mBoardNo) {
		return myBoardListDao.selectMyBoardMember2(mBoardNo);
	}
}

