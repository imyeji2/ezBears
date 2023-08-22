package com.ez.ezBears.dept.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ez.ezBears.common.SearchVO;

@Mapper
public interface DeptDAO {
	List<DeptVO> selectDeptList();
	
	//멤버 등록 시 부서 번호로 부서 이름 찾아오기
	String findDeptName(int deptNo);
	
	//총 부서 수
	int totalList(SearchVO searchVo);
	
	//부서 수정
	int editDept(DeptVO deptVo);
	
	//부서 등록
	int insertDept(DeptVO deptVo);
}
