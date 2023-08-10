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
}
