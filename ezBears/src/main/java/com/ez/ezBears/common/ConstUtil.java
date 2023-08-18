package com.ez.ezBears.common;

public interface ConstUtil {
	//게시판 페이징 처리 관련 상수
	public static final int RECORD_COUNT=10;
	int BLOCK_SIZE=5; //인터페이스라 이렇게 가능 앞에 public static final가 붙어 있는거임
	
	//파일 업로드 처리 관련 상수
	//String FILE_UPLOAD_TYPE ="test";
	String FILE_UPLOAD_TYPE="deploy";
	
	//자료실 파일 저장 경로
	String FILE_UPLOAD_PATH = "pds_upload";
	
	//멤버 등록 페이지 - 멤버 등록시 이미지 저장 경로
  String IMAGE_FILE_UPLOAD_PATH="img/mem_images";
	
	//팀별 공지사항 첨부파일
	String TEAM_NOTICE_FILE_PACH="file/teamNotice";
	
	//스태프 등록 페이지 - 멤버 등록시 이미지 저장 경로
	String STAFFIMAGE_FILE_UPLOAD_PATH="img/staffImages";
	
	//공통으로 위치 맞추기
	//String TEAM_NOTICE_FILE_PACH_TEST="C:\\FinalProject\\ezBears\\src\\main\\webapp\\file\\teamNotice";
  
	//자료실 업로드인지, 멤버 등록시 업로드인지 구분값
	int UPLOAD_FILE_FLAG=1;//자료실 업로드
	int UPLOAD_MEMIMAGE_FLAG=2;//멤버 등록시 이미지 업로드
	int UPLOAD_TEAMNOTICE_FLAG=3;//팀별 공지사항
	int UPLOAD_STAFFIMAGE_FLAG=4;	//스태프 등록 플래그
}



