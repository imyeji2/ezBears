package com.ez.ezBears.common;

public interface ConstUtil {
	//게시판 페이징 처리 관련 상수
	public static final int RECORD_COUNT=10;
	int MEMRECORD_COUNT=20;
	int RECORD_COUNT_FIVE =5;
	int RECORD_COUNT_SIX =6;
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
	
	//웹하드 첨부파일 
	String WEB_HARD_FILE_PATH="file/webHard";
	
	//선수 등록 페이지 - 선수 등록시 이미지 저장 경로
	String TEAMIMAGE_FILE_UPLOAD_PATH="img/teamImages";
	
	//결재 첨부파일
	String APPROVAL_FILE_UPLOAD_PATH="file/approval";
	
	//팀별 업무 게시판 첨부 파일
	String TEAM_WORK_BOARD_FILE_PACH="file/teamWorkBoard";
	
	//공통으로 위치 맞추기
	//String TEAM_NOTICE_FILE_PACH_TEST="C:\\FinalProject\\ezBears\\src\\main\\webapp\\file\\teamNotice";
	
	//다중파일 업로드
	String NOTICE_FILE_UPLOAD_PATH="img/notice";
	String NOTICE_FILE_PATH="file/notice";
	String BOARD_FILE_UPLOAD_PATH="img/board";
	String BOARD_FILE_PATH="file/board";
	
	//자료실 업로드인지, 멤버 등록시 업로드인지 구분값
	int UPLOAD_FILE_FLAG=1;//자료실 업로드
	int UPLOAD_MEMIMAGE_FLAG=2;//멤버 등록시 이미지 업로드
	int UPLOAD_TEAMNOTICE_FLAG=3;//팀별 공지사항
	int UPLOAD_STAFFIMAGE_FLAG=4;	//스태프 이미지 등록 플래그
	int UPLOAD_WEBHARD_FLAG=5;	//웹하드 업로드
	int UPLOAD_TEAMIMAGE_FLAG=6;	//선수 이미지 등록 플래그
	int UPLOAD_NOTICE_FLAG=7;	//공지사항 등록 플래그
	int UPLOAD_APPROVAL_FLAG=8;	//결재파일 플래그
	int UPLOAD_TEAMWORKBOARD_FLAG =9; //팀별 업무 게시판 플래그
	int UPLOAD_BOARD_FLAG=10; //자유게시판 플래그
	
}



