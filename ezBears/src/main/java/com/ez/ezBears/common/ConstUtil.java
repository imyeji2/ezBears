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
	String FILE_UPLOAD_PATH_TEST = "C:\\Users\\yj\\Desktop\\lecture\\workspace_list\\sp_ws\\spherb\\src\\main\\webapp\\pds_upload";
	
	//멤버 등록 페이지 - 멤버 등록시 이미지 저장 경로
	String IMAGE_FILE_UPLOAD_PATH="mem_images";
	String IMAGE_FILE_UPLOAD_PATH_TEST="C:\\Users\\yj\\Desktop\\lecture\\workspace_list\\sp_ws\\spherb\\src\\main\\webapp\\pd_images";

	//자료실 업로드인지, 멤버 등록시 업로드인지 구분값
	int UPLOAD_FILE_FLAG=1;//자료실 업로드
	int UPLOAD_MEMIMAGE_FLAG=2;//멤버 등록시 이미지 업로드
}
