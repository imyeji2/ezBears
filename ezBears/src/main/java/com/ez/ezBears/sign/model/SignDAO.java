package com.ez.ezBears.sign.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ez.ezBears.common.SearchVO;
import com.ez.ezBears.common.SignListSearchVO;
import com.ez.ezBears.notice.model.NoticeFileVO;

@Mapper
public interface SignDAO {

	//결재 등록
	int insertApproval(SignVO signVo);
	
	//전체 리스트
	List<Map<String, Object>> selectApprovalList(SignListSearchVO signListSearchVo);
	
	// total레코드
	int selectAppCount(SearchVO searchVo);
	
	// 디테일
	Map<String, Object> detailSign(int docNo);
	

	//승인처리
	int updateStatus(int docNo);
	
	//처리상태
	String selectStatus(int docNo);

	//파일 업로드
	int insertSignFile(SignFileVO signFileVo);
	
	

	//결제중 상태인 db 전체 조회
	List<Map<String, Object>> selectAllUnder();
	
	//결재완료 상태인 db 전체 조회
	List<Map<String, Object>> selectAllComplete();
	
}