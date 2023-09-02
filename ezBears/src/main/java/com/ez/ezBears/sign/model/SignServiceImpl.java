package com.ez.ezBears.sign.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ez.ezBears.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SignServiceImpl implements SignService{

	private final SignDAO signDao;

	
	// 결재 등록
	@Override
	public int insertApproval(SignVO signVo) {
		return signDao.insertApproval(signVo);
	}


	@Override
	public int selectAppCount(SearchVO searchVo) {
		return signDao.selectAppCount(searchVo);
	}


	@Override
	public List<Map<String, Object>> selectApprovalList(SearchVO searchVo) {
		return signDao.selectApprovalList(searchVo);
	}


	@Override
	public Map<String, Object> detailSign(int docNo) {
		return signDao.detailSign(docNo);
	}


	@Override
	public SignVO updateStatus(int docNo) {
		return signDao.updateStatus(docNo);
	}







	



	
	
}
