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
	
	@Override
	public int updateStatus2(int docNo) {
		return signDao.updateStatus2(docNo);
	}
	

	// 결재 처리상태 검색
	@Override
	public String selectStatus(int docNo) {
		return signDao.selectStatus(docNo);
	}
	
	//파일 등록
	@Override
	public int insertSignFile(List<Map<String, Object>> files, int docNo) {
		logger.info("docNo={}",docNo);
		int cnt = 0;
		logger.info("files={},files.size={}",files,files.size());
		
		if(files != null || !files.isEmpty()) {
			for(Map<String, Object> map : files) {
				SignFileVO vo = new SignFileVO();
				
				vo.setDocNo(docNo);
				vo.setFileName((String) map.get("fileName"));
				vo.setOriginFileName((String) map.get("originalFileName"));
				vo.setFsize((long) map.get("fileSize"));
				
				cnt = signDao.insertSignFile(vo);
				logger.info("파일 등록  결과 cnt={}", cnt);
			}
		}
		
		return cnt;
	
	
	}

	//해당 결재문서의 파일 정보
	@Override
	public List<Map<String, Object>> selectSignnFileInfo(int docNo) {
		return signDao.selectSignnFileInfo(docNo);
	}
	


	@Override
	public List<Map<String, Object>> selectAllUnder(SearchVO searchVo, String searchTitle, int searchDeptNo,
			String searchName) {
		return signDao.selectAllUnder(searchVo, searchTitle, searchDeptNo, searchName);
	}


	@Override
	public List<Map<String, Object>> selectAllComplete(SearchVO searchVo, String searchTitle, int searchDeptNo,
			String searchName) {
		return signDao.selectAllComplete(searchVo, searchTitle, searchDeptNo, searchName);
	}

	@Override
	public int countAllUnder(String searchTitle, int searchDeptNo, String searchName) {
		return signDao.countAllUnder(searchTitle, searchDeptNo, searchName);
	}

	@Override
	public int countAllComplete(String searchTitle, int searchDeptNo, String searchName) {
		return signDao.countAllComplete(searchTitle, searchDeptNo, searchName);
	}

	@Override
	public SignMemInfoVO selectApprovaMem(int docNo) {
		return signDao.selectApprovaMem(docNo);
	}
	
	//결재 수정
	@Override
	public int updateSignInfo(SignVO signVo) {
		return signDao.updateSignInfo(signVo);
	}



	
	
}
