package com.ez.ezBears.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jakarta.servlet.http.HttpServletRequest;

@Component
public class FileUploadUtil2 {
	private static final Logger logger = LoggerFactory.getLogger(FileUploadUtil2.class);

	public List<Map<String, Object>> fileupload(HttpServletRequest request,
			int pathFlag) throws IllegalStateException, IOException {
		//파일 업로드 처리
		MultipartHttpServletRequest multiRequest 
						= (MultipartHttpServletRequest) request;

		//Map<String, MultipartFile> fileMap=multiRequest.getFileMap();
		List<MultipartFile> files =multiRequest.getFiles("upfile");
		//multiful로 설정해서 여러개 파일을 업로드 하고 싶을때 이렇게 활용
		
		System.out.println(files.size());
		
		//여러개 업로드된 파일의 정보를 저장할 리스트
		List<Map<String, Object>> resultList = new ArrayList<>();
		//Iterator<String> iter = fileMap.keySet().iterator();
		int i=0;
		while(i<files.size()) {
			//String key=iter.next();
			MultipartFile tempFile = files.get(i);//fileMap.get(key);//업로드된 파일을 임시파일 형태로 제공
			if(!tempFile.isEmpty()) { //파일이 업로드된 경우
				long fileSize=tempFile.getSize(); //파일 크기
				String originName=tempFile.getOriginalFilename(); //변경전 파일명

				//변경된 파일 이름
				String fileName = getUniqueFileName(originName);

				//파일 업로드 처리
				String uploadPath = getUploadPath(request, pathFlag);
				File file = new File(uploadPath, fileName);
				tempFile.transferTo(file);

				//업로드 파일 정보 저장
				Map<String, Object> resultMap = new HashMap<>();
				resultMap.put("fileName", fileName);
				resultMap.put("originalFileName", originName);
				resultMap.put("fileSize", fileSize);

				resultList.add(resultMap);
				
			}//if			
			i++;
		}//while

		return resultList;
	}

	public String getUploadPath(HttpServletRequest request, int pathFlag) {
		//업로드 경로 구하기
		String path="";

		if(ConstUtil.FILE_UPLOAD_TYPE.equals("test")) {
			if(pathFlag== ConstUtil.UPLOAD_FILE_FLAG) {  //자료실
				//path=ConstUtil.FILE_UPLOAD_PATH_TEST;
			}else if(pathFlag==ConstUtil.UPLOAD_MEMIMAGE_FLAG) { //멤버 이미지 업로드
				//path=ConstUtil.IMAGE_FILE_UPLOAD_PATH_TEST;				
			}else if(pathFlag==ConstUtil.UPLOAD_NOTICE_FLAG) { //공지사항
				path=ConstUtil.NOTICE_FILE_PATH;
			}
		}else {//deploy
			if(pathFlag== ConstUtil.UPLOAD_FILE_FLAG) {  //자료실
				path=ConstUtil.FILE_UPLOAD_PATH; //pds_upload
			}else if(pathFlag==ConstUtil.UPLOAD_MEMIMAGE_FLAG) { //멤버 이미지 업로드
				path=ConstUtil.IMAGE_FILE_UPLOAD_PATH;// mem_images					
			}else if(pathFlag ==ConstUtil.UPLOAD_TEAMNOTICE_FLAG) {//팀 공지사항
				path=ConstUtil.TEAM_NOTICE_FILE_PACH;
			}else if(pathFlag == ConstUtil.UPLOAD_STAFFIMAGE_FLAG) {	//스태프 이미지 업로드
				path=ConstUtil.STAFFIMAGE_FILE_UPLOAD_PATH;
			}else if(pathFlag == ConstUtil.UPLOAD_TEAMIMAGE_FLAG) {	//선수 이미지 업로드
				path=ConstUtil.TEAMIMAGE_FILE_UPLOAD_PATH;
			}else if(pathFlag == ConstUtil.UPLOAD_NOTICE_FLAG) { //공지사항
				path=ConstUtil.NOTICE_FILE_PATH;
			}else if(pathFlag == ConstUtil.UPLOAD_NOTICE_FLAG) { //공지사항
				path=ConstUtil.NOTICE_FILE_PATH;
			}else if(pathFlag == ConstUtil.UPLOAD_WEBHARD_FLAG) {	//웹하드 업로드
				path=ConstUtil.WEB_HARD_FILE_PATH;
			}else if(pathFlag == ConstUtil.UPLOAD_APPROVAL_FLAG) {	//결재 업로드
				path=ConstUtil.APPROVAL_FILE_UPLOAD_PATH;
			}else if(pathFlag == ConstUtil.UPLOAD_BOARD_FLAG) { //자유게시판
				path=ConstUtil.BOARD_FILE_PATH;
			}
			
			
			//실제 물리적인 경로 구하기
			path=request.getSession().getServletContext().getRealPath(path);
		}

		logger.info("업로드 경로 : {}", path);

		return path;
	}

	public String getDateTimeStamp() {
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String result = sdf.format(d);
		logger.info("날짜 밀리초 : {}", result);
		
		return result;
	}

	public String getUniqueFileName(String originName) {
		//ab.txt => ab_밀리초.txt
		int idx = originName.lastIndexOf(".");
		String fName = originName.substring(0,idx); //ab
		String ext = originName.substring(idx); //.txt
		
		String result = fName+"_"+getDateTimeStamp()+ ext;
		logger.info("변경된 파일명 : {}", result);
		
		return result;
	}
	

}
