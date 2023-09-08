package com.ez.ezBears.MBoard.model;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.ez.ezBears.common.SearchVO;
import com.ez.ezBears.myBoard.model.MyBoardDAO;
import com.ez.ezBears.myBoard.model.MyBoardVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MBoardServiceImpl implements MBoardService{

	private final MBoardDAO mBoardDao;
	private final MyBoardDAO myBoardDao;
	@Override
	public int checkSameName(String mBoardName) {
		return mBoardDao.checkSameName(mBoardName);
	}

	@Override
	public int insertMBoard(MBoardVO mBoardVo) {
		return mBoardDao.insertMBoard(mBoardVo);
	}

	@Override
	public List<MBoardVO> selectAllboard(SearchVO searchVo) {
		return mBoardDao.selectAllboard(searchVo);
	}

	@Override
	public int totalBoardList(SearchVO searchVo) {
		return mBoardDao.totalBoardList(searchVo);
	}

	
	//예지
	//마이보드 추가 등록
	@Override
	@Transactional
	public int addBoard(MBoardVO mBoardVo) {
		int cnt=0;
		try {
			
			cnt = mBoardDao.addMboard(mBoardVo);
			System.out.println("보드 등록 결과 cnt="+cnt);
			
			MyBoardVO vo = new MyBoardVO();
			vo.setMemNo(mBoardVo.getMemNo());
			vo.setMBoardNo(mBoardVo.getMBoardNo());
			
			System.out.println("마이 보드 등록 vo="+vo);
			
			cnt = myBoardDao.addMyboard(vo);
			
		}catch(RuntimeException e) {
			//선언적 트랜젝션(@Transactional)에서는
			//런타임 예외가 발생하면 롤백한다.
			e.printStackTrace();
			cnt=-1;//예외처리를 했다는 의미
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return cnt;
	}

	@Override
	public int updateMboard(MBoardVO mBoardVo) {
		return mBoardDao.updateMboard(mBoardVo);
	}

	//보드 이름 검색
	@Override
	public String selectMboardName(int mBoardNo) {
		return mBoardDao.selectMboardName(mBoardNo);
	}
	
	
	//보드 관리자 검색
	@Override
	public MBoardVO selectMboardAdminNo(int mBoardNo) {
		return mBoardDao.selectMboardAdminNo(mBoardNo);
	}
	
	




}
