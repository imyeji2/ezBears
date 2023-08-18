package com.ez.ezBears.dept.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DeptServiceImpl implements DeptService{
	private final DeptDAO deptDao;

	@Override
	public List<DeptVO> selectDeptList() {
		return deptDao.selectDeptList();
	}
	
	//멤버 등록 시 부서 번호로 부서 이름 찾아오기
	@Override
	public String findDeptName(int deptNo) {
		return deptDao.findDeptName(deptNo);
	}
}
