package com.ez.ezBears.staff.model;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ez.ezBears.member.model.MemberService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StaffServiceImpl implements StaffService {
	private final StaffDAO staffDao;

	@Override
	public int selectCheckId(String staffId) {
		int count = staffDao.selectCheckId(staffId);

		int result = 0;
		if (count > 0) {
			result = StaffService.EXIST_ID;
		} else {
			result = StaffService.NONE_EXIST_ID;
		}

		return result;
	}

	@Override
	public int loginCheck(String staffId, String staffPwd) {
		String dbPwd = staffDao.selectPwd(staffId);
		System.out.println("dbPwd=" + dbPwd);

		String staffStatus = staffDao.selectStatus(staffId);
		System.out.println("staffStatus=" + staffStatus);

		int result = 0;
		if (dbPwd == null || dbPwd.isEmpty()) {
			result = StaffService.USERID_NONE;
		} else {
			if (dbPwd.equals(staffPwd)) {
				result = StaffService.LOGIN_OK;
				if (staffStatus.equals("N")) {
					result = StaffService.USERID_DONE;
				}
			} else {
				result = StaffService.PWD_DISAGREE;
			}
		}

		return result;
	}

	@Override
	public int insertStaff(StaffVO staffVo) {
		return staffDao.insertStaff(staffVo);
	}

	@Override
	public List<StaffVO> selectAllStaff() {
		return staffDao.selectAllStaff();
	}

	@Override
	public StaffVO getStaffById(String staffId) {
		return staffDao.getStaffById(staffId);
	}
	
	
}
