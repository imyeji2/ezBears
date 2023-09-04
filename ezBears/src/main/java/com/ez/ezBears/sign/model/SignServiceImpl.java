package com.ez.ezBears.sign.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ez.ezBears.common.SearchVO;
import com.ez.ezBears.common.SignListSearchVO;
import com.ez.ezBears.notice.model.NoticeFileVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SignServiceImpl implements SignService{

	private final SignDAO signDao;
	private static final Logger logger = LoggerFactory.getLogger(SignServiceImpl.class);
	
	// 결재 등록
	@Override
	public int insertApproval(SignVO signVo) {
		return signDao.insertApproval(signVo);
	}

	//
	@Override
	public int selectAppCount(SearchVO searchVo) {
		return signDao.selectAppCount(searchVo);
	}

	//결재 디테일
	@Override
	public Map<String, Object> detailSign(int docNo) {
		return signDao.detailSign(docNo);
	}

	// 결재 리스트
	@Override
	public List<Map<String, Object>> selectApprovalList(SignListSearchVO signListSearchVo) {
		return signDao.selectApprovalList(signListSearchVo);
	}

	// 결재 처리상태
	@Override
	public int updateStatus(int docNo) {
		return signDao.updateStatus(docNo);
	}

	// 결재 처리상태 검색
	@Override
	public String selectStatus(int docNo) {
		return signDao.selectStatus(docNo);
	}
	
	//파일 등록
	@Override
	public int insertSignFile(List<Map<String, Object>> files, int docNo) {
		int cnt = 0;
		logger.info("files={},files.size={}",files,files.size());
		
		if(files != null || !files.isEmpty()) {
			for(Map<String, Object> map : files) {
				SignFileVO vo = new SignFileVO();
				
				vo.setFileNo(docNo);
				vo.setFilename((String) map.get("fileName"));
				vo.setOriginFilename((String) map.get("originalFileName"));
				vo.setFsize((long) map.get("fileSize"));
				
				cnt = signDao.insertSignFile(vo);
				logger.info("파일 등록  결과 cnt={}", cnt);
			}
		}
		
		return cnt;
	
	
	}


	@Override
	public List<Map<String, Object>> selectAllUnder() {
		return signDao.selectAllUnder();
	}


	@Override
	public List<Map<String, Object>> selectAllComplete() {
		return signDao.selectAllComplete();
	}







	



	
	
}
