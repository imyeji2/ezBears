package com.ez.ezBears.sign.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ez.ezBears.common.SearchVO;
import com.ez.ezBears.common.SignListSearchVO;

public interface SignService {

	//결재등록
	int insertApproval(SignVO signVo);
	
	// 전체 리스트
	List<Map<String, Object>> selectApprovalList(SignListSearchVO signListSearchVo);
	
	//total레코드
	int selectAppCount(SearchVO searchVo);
	
	// 결재 디테일
	Map<String, Object> detailSign(int docNo);
	
	// 결재 상태 변경
	int updateStatus(int docNo);
	int updateStatus2(int docNo);
	
	// 결재 변경상태 가져오기
	String selectStatus(int docNo);
	
	// 결재작성시 파일 업로드
	int insertSignFile(List<Map<String, Object>> files, int docNo);

	//해당 결재문서의 파일 정보
	List<Map<String, Object>> selectSignnFileInfo(int docNo);
	
	//결제중 상태인 db 전체 조회
	List<Map<String, Object>> selectAllUnder(@Param("searchVo") SearchVO searchVo,@Param("searchTitle") String searchTitle,
			@Param("searchDeptNo") int searchDeptNo, @Param("searchName") String searchName);
	
	//결재완료 상태인 db 전체 조회
	List<Map<String, Object>> selectAllComplete(@Param("searchVo") SearchVO searchVo,@Param("searchTitle") String searchTitle,
			@Param("searchDeptNo") int searchDeptNo, @Param("searchName") String searchName);
	
	int countAllUnder(@Param("searchTitle") String searchTitle,
			@Param("searchDeptNo") int searchDeptNo, @Param("searchName") String searchName);
	int countAllComplete(@Param("searchTitle") String searchTitle,
			@Param("searchDeptNo") int searchDeptNo, @Param("searchName") String searchName);
	
}

