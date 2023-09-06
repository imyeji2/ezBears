package com.ez.ezBears.attendanceManagement.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ez.ezBears.attendance.model.AttendanceService;
import com.ez.ezBears.common.ConstUtil;
import com.ez.ezBears.common.PaginationInfo;
import com.ez.ezBears.common.SearchVO;
import com.ez.ezBears.dept.model.DeptService;
import com.ez.ezBears.dept.model.DeptVO;

import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/attendanceManagement")
@RequiredArgsConstructor
public class AttendanceController {
	private static final Logger logger = LoggerFactory.getLogger(AttendanceController.class);
	
	private final DeptService deptService;
	private final AttendanceService attendanceService;
	/*
	@GetMapping("/attendanceAll")
	public String attendanceAll() {
		
		return "/attendanceManagement/attendanceAll";
		
		//http://localhost:9091/ezBears/attendanceManagement/attendanceAll
	}
	*/
	
	@RequestMapping("/attendanceSearch")
	public String attendanceSearch(@ModelAttribute SearchVO searchVo,
			@RequestParam(required = false) String date11,
			@RequestParam(required = false) String date22,
			@RequestParam(defaultValue = "0") int searchDeptNo,
			@RequestParam(required = false) String searchName,
			Model model) throws ParseException {
		logger.info("출/퇴근 검색 화면 이동");
		
		logger.info("searchDeptNo={}", searchDeptNo);
		logger.info("searchName={}", searchName);
		logger.info("date11={}, date22={}", date11, date22);
		
		List<DeptVO> deptList = deptService.selectDeptList();
		model.addAttribute("deptList", deptList);
		logger.info("여기까지는 되나?");
		
		//여기서 하게되면 searchVo가 아직 null 이라서 list 자체도 null 이 나오게 된다
		/*
		List<Map<String, Object>> attendanceList = attendanceService.selectAllView(searchVo);
		logger.info("출/퇴근 검색 화면에 view 띄우기, attendanceList.size={}", attendanceList.size());
		*/
		
		//-----------------------------여기부터는 페이징처리와 검색 처리를 위한 코드들--------------------------------------------
		//pagination 객체 생성해서 없는 변수들 선언해준다
		PaginationInfo pagination = new PaginationInfo();
		pagination.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagination.setCurrentPage(searchVo.getCurrentPage());
		pagination.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		
		//pagination 객체 이용해서 searchVo에 필요한 변수 마저 선언해주기
		searchVo.setFirstRecordIndex(pagination.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		logger.info("설정 후 searchVo={}", searchVo);
		
		int totalRecord = attendanceService.countAllView(date11, date22, searchDeptNo, searchName);
		pagination.setTotalRecord(totalRecord);
		
		model.addAttribute("pagination", pagination);
		
		List<Map<String, Object>> attendanceList = attendanceService.selectAllView(searchVo, date11, date22, searchDeptNo, searchName);
		logger.info("출/퇴근 검색 화면에 view 띄우기, attendanceList.size={}", attendanceList.size());
		
		//------------------------------이제부터 근무시간을 계산하기 위한 코드들---------------------------------------
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		
		//for문 안에서 각각 map 요소들 세팅
		for(Map<String, Object> map : attendanceList) {
			Timestamp timestamp1 = (Timestamp) map.get("IN_TIME");
			logger.info("timestamp1={}", timestamp1);
			Timestamp timestamp2 = (Timestamp) map.get("OUT_TIME");
			logger.info("timestamp2={}", timestamp2);
			
			double hourGap = 0;  // 기본적으로 시간 차이를 0으로 설정
			
			if(timestamp2 != null) {  // date2가 비어있지 않은 경우에만 계산
				String date1 = timestamp1.toString(); // Timestamp를 String으로 변환
				String date2 = timestamp2.toString(); // Timestamp를 String으로 변환
				
				Date format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date1);
				Date format2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date2);
				
				// 시간의 차이 구하기
				hourGap = Math.ceil(((format2.getTime() - format1.getTime()) / 3600000d)*10)/10;
			}
			
			//logger.info("hourGap={}", hourGap);
			
			map.put("hourGap", Double.toString(hourGap));
			//logger.info("map={}", map);
		}
		
		logger.info("출/퇴근 상세보기 처리 후, attendanceList.size={}", attendanceList.size());
		
		model.addAttribute("attendanceList", attendanceList);
		
		return "/attendanceManagement/attendanceSearch";
		
		//http://localhost:9091/ezBears/attendanceManagement/attendanceSearch
	}
	
	@RequestMapping("/excel")
	public ResponseEntity<InputStreamResource> downloadExcel(HttpServletResponse response,
			@RequestParam(required = false) String date11,
			@RequestParam(required = false) String date22,
			@RequestParam(defaultValue = "0") int searchDeptNo,
			@RequestParam(required = false) String searchName,
			Model model) throws ParseException, IOException {
		//다운로드 받을 리스트를 전체 조회
        List<Map<String, Object>> allList = attendanceService.findAllToExcel(date11, date22, searchDeptNo, searchName);
        logger.info("엑셀로 출력할 리스트의 사이즈 list.size={}", allList.size());
        
		//------------------------------이제부터 근무시간을 계산하기 위한 코드들---------------------------------------
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
		
		//for문 안에서 각각 map 요소들 세팅
		for(Map<String, Object> map : allList) {
			Timestamp timestamp1 = (Timestamp) map.get("IN_TIME");
			//logger.info("timestamp1={}", timestamp1);
			Timestamp timestamp2 = (Timestamp) map.get("OUT_TIME");
			//logger.info("timestamp2={}", timestamp2);
			
			double hourGap = 0;  // 기본적으로 시간 차이를 0으로 설정
			
			if(timestamp2 != null) {  // date2가 비어있지 않은 경우에만 계산
				String date1 = timestamp1.toString(); // Timestamp를 String으로 변환
				String date2 = timestamp2.toString(); // Timestamp를 String으로 변환
				
				Date format1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date1);
				Date format2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(date2);
				
				// 시간의 차이 구하기
				hourGap = Math.ceil(((format2.getTime() - format1.getTime()) / 3600000d)*10)/10;
			}
			
			//logger.info("hourGap={}", hourGap);
			
			map.put("hourGap", Double.toString(hourGap));
			logger.info("map={}", map);
		}
        logger.info("for문 끝");
        
        
        //--------------------------엑셀 다운로드 처리 위한 코드들----------------------
        
        try (Workbook workbook = new XSSFWorkbook()) {
			logger.info("워크북 객체");
			int rowNo = 0;
			logger.info("rowNo");
			Sheet sheet = workbook.createSheet("출근 기록 정보");
			logger.info("sheet생성");
			
			CellStyle headStyle = workbook.createCellStyle();
            headStyle.setFillForegroundColor(HSSFColor.HSSFColorPredefined.LIGHT_BLUE.getIndex());
            headStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
            Font font = workbook.createFont();
            font.setColor(HSSFColor.HSSFColorPredefined.WHITE.getIndex());
            font.setFontHeightInPoints((short) 13);
            headStyle.setFont(font);
			
			Row headerRow = sheet.createRow(rowNo++);
			headerRow.createCell(0).setCellValue("일자");
			headerRow.createCell(1).setCellValue("부서명");
			headerRow.createCell(2).setCellValue("사원명");
			headerRow.createCell(3).setCellValue("출근시간");
			headerRow.createCell(4).setCellValue("퇴근시간");
			headerRow.createCell(5).setCellValue("근무시간");
			headerRow.createCell(6).setCellValue("근무상태");
			//logger.info("여기까진 다 찍히고 for 문안에서 뭔가 오류가 나나보다");
			
			for(int i=0; i<=6; i++){
                headerRow.getCell(i).setCellStyle(headStyle);
            }
			
	        for(Map<String, Object> map2 : allList) {
	        	Row row = sheet.createRow(rowNo++);
	        	String day = (map2.get("IN_TIME").toString()).substring(0, 10);
	        	//logger.info("IN_TIME 사용하는 부분이 문제가 되나?");
	        	row.createCell(0).setCellValue(day);
	        	row.createCell(1).setCellValue((String)map2.get("DEPT_NAME"));
	            row.createCell(2).setCellValue((String)map2.get("MEM_NAME"));
	            //logger.info("여기까지 되나?");
	            row.createCell(3).setCellValue(map2.get("IN_TIME").toString().substring(11));
	            //logger.info("여기부터 안되겠지?");
	            if (map2.get("OUT_TIME") == null) {
	            	//logger.info("null인 경우");
	            	row.createCell(4).setCellValue("");
				}else {
					//logger.info("null 아닐 경우");
					row.createCell(4).setCellValue(map2.get("OUT_TIME").toString().substring(12));
				}
	            //logger.info("이제 안되면 말안됨");
	            row.createCell(5).setCellValue((String)map2.get("hourGap"));
	            row.createCell(6).setCellValue((String)map2.get("STATUS"));
	        }
	        
	        sheet.setColumnWidth(0, 4000);
            sheet.setColumnWidth(1, 4000);
            sheet.setColumnWidth(2, 4000);
            sheet.setColumnWidth(3, 7000);
            sheet.setColumnWidth(4, 7000);
            sheet.setColumnWidth(5, 4000);
            sheet.setColumnWidth(6, 4000);
 
            File tmpFile = File.createTempFile("TMP~", ".xlsx");
            try (OutputStream fos = new FileOutputStream(tmpFile);) {
                workbook.write(fos);
            }
            InputStream res = new FileInputStream(tmpFile) {
                @Override
                public void close() throws IOException {
                    super.close();
                    if (tmpFile.delete()) {
                        logger.info("() -> 임시 파일 삭제 완료");
                    }
                }
            };
 
            return ResponseEntity.ok() //
                    .contentLength(tmpFile.length()) //
                    .contentType(MediaType.APPLICATION_OCTET_STREAM) //
                    .header("Content-Disposition", "attachment;filename=attendanceList.xlsx") //
                    .body(new InputStreamResource(res));
		}
	}

	
	
	
	
	
}
