package com.ez.ezBears.dept.model;

import java.util.List;

public interface DeptService {
	List<DeptVO> selectDeptList();
	
	//멤버 등록 시 부서 번호로 부서 이름 찾아오기
	String findDeptName(int deptNo);
}
