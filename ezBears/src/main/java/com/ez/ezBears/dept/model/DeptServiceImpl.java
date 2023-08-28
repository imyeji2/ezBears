package com.ez.ezBears.dept.model;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ez.ezBears.common.SearchVO;

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

	@Override
	public int totalList(SearchVO searchVo) {
		return deptDao.totalList(searchVo);
	}

	@Override
	public int editDept(DeptVO deptVo) {
		return deptDao.editDept(deptVo);
	}

	@Override
	public int insertDept(DeptVO deptVo) {
		return deptDao.insertDept(deptVo);
	}

	@Override
	public int checkDeptName(String deptName) {
		return deptDao.checkDeptName(deptName);
	}

	@Override
	public int deleteDept(int deptNo) {
		return deptDao.deleteDept(deptNo);
	}
}
