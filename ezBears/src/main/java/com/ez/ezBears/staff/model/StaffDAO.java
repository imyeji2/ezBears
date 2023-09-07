package com.ez.ezBears.staff.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ez.ezBears.common.SearchVO;

@Mapper
public interface StaffDAO {
	int selectCheckId(String staffId);
	String selectPwd(String staffId);
	String selectStatus(String staffId);
	int insertStaff(StaffVO staffVo);
	StaffVO getStaffById(String staffId);
	int getTotalRecord();
	
	Map<String, Object> selectStaffView(String staffId);

	List<StaffVO> selectAllStaff(SearchVO searchVo);
	int getTotalRecord(SearchVO searchVo);
	StaffVO selectByStaffNo(int staffNo);
	int updateStaff(StaffVO staffVo);
	int deleteStaff(int staffNo);
	
	int getTodayStaff(String contractStart);
	int isStaffId(String staffId);
	
	int selectCntStaff();
	
	int selectStaffNo(String staffId);
	
	StaffVO selectByUserid(String staffId);
	int updateMypage(StaffVO staffVo);
	int updatePwd(StaffVO staffVo);
}
