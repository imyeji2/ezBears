package com.ez.ezBears.staff.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ez.ezBears.common.SearchVO;
import com.ez.ezBears.member.model.MemberService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StaffServiceImpl implements StaffService {
	private final StaffDAO staffDao;
	private final static Logger logger = LoggerFactory.getLogger(StaffService.class);

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
	public StaffVO getStaffById(String staffId) {
		return staffDao.getStaffById(staffId);
	}

	@Override
	public List<StaffVO> selectAllStaff(SearchVO searchVo) {
		return staffDao.selectAllStaff(searchVo);
	}

	@Override
	public int getTotalRecord(SearchVO searchVo) {
		return staffDao.getTotalRecord(searchVo);
	}

	@Override
	public Map<String, Object> selectStaffView(String staffId) {
		return staffDao.selectStaffView(staffId);
	}

	public StaffVO selectByStaffNo(int staffNo) {
		return staffDao.selectByStaffNo(staffNo);
	}

	@Override
	public int updateStaff(StaffVO staffVo) {
		return staffDao.updateStaff(staffVo);
	}

	@Override
	public int deleteStaff(int staffNo) {
		return staffDao.deleteStaff(staffNo);
	}

	@Override
	public String getStaffId() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String today = sdf.format(new Date());
		
		int todayCount = staffDao.getTodayStaff(today);
		
		String staffId = "ez_st_" + today + String.format("%03d", todayCount+1);
		
		int cnt = staffDao.isStaffId(staffId);
		
		//생성된 id 가 이미 있는 경우
		if(cnt > 0) {
			int increment = 1;
			do {
				staffId = "ez_st_" + today + String.format("%03d", todayCount+increment);
				increment++;
			}while(!(cnt > 0));
		}
		
		return staffId;
	}

	@Override
	public int selectCntStaff() {
		return staffDao.selectCntStaff();
	}

	@Override
	public int selectStaffNo(String staffId) {
		return staffDao.selectStaffNo(staffId);
	}

	@Override
	public StaffVO selectByUserid(String staffId) {
		return staffDao.selectByUserid(staffId);
	}

	@Override
	public int updateMypage(StaffVO staffVo) {
		logger.info("회원정보수정 파라미터 staffVo={}",staffVo);
		return staffDao.updateMypage(staffVo);
	}

	@Override
	public int updatePwd(StaffVO staffVo) {
		return staffDao.updatePwd(staffVo);
	}
}
