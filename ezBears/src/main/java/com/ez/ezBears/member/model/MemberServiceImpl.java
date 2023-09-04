package com.ez.ezBears.member.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ez.ezBears.common.SearchVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{
	private final MemberDAO memberDao;
	
	@Override
	public int selectCheckId(String memId) {
		int count = memberDao.selectCheckId(memId);

		int result=0;
		if(count>0) {
			result = MemberService.EXIST_ID;			
		}else {
			result = MemberService.NONE_EXIST_ID;			
		}

		return result;
	}

	@Override
	public int loginCheck(String memId, String memPwd) {
		String dbPwd=memberDao.selectPwd(memId);

		int result=0;
		if(dbPwd==null || dbPwd.isEmpty()) {
			result=MemberService.USERID_NONE;
		}else {
			if(dbPwd.equals(memPwd)) {
				result=MemberService.LOGIN_OK;				
			}else {
				result=MemberService.PWD_DISAGREE;
			}
		}

		return result;
	}

	//자동 아이디 생성
	@Override
	public String createMemId() {
		
		//오늘 날짜
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String today = sdf.format(new Date());
		
		//오늘 생성된 사원 수 증가
		int todayMemCnt = memberDao.getTodayMem(today);
		
		String memberId = "ez_fr_" + today + String.format("%03d", todayMemCnt+1);
		
        if (isMemberIdExists(memberId)) {
            int increment = 1;
            do {
                memberId = "ez_fr_" + today + String.format("%03d", todayMemCnt + increment);
                increment++;
            } while (isMemberIdExists(memberId));
        }

        return memberId;
	}

    private boolean isMemberIdExists(String memId) {
        return memberDao.isMemId(memId) > 0;
    }
    
    
    //멤버 등록
	@Override
	public int insertMem(MemberVO memberVo) {
		return memberDao.insertMem(memberVo);
	}

	@Override
	public MemberVO getMemberById(String memId) {
		return memberDao.getMemberById(memId);
	}

	@Override
	public void updateMember(MemberVO memberVO) {
		memberDao.updateMember(memberVO);
	}
	
	//멤버 리스트
	@Override
	public List<MemberVO> selectAllMem(SearchVO searchVo) {
		return memberDao.selectAllMem(searchVo);
	}
	
	@Override
	public int totalList(SearchVO searchVo) {
		return memberDao.totalList(searchVo);
	}
	
	@Override
	public MemberVO memberDetail(int memNo) {
		return memberDao.memberDetail(memNo);
	}
	
	
	//

	@Override
	public int selectMemberNo(String memId) {
		return memberDao.selectMemberNo(memId);
	}

	@Override
	public Map<String, Object> selectMemberView(String memId) {
		return memberDao.selectMemberView(memId);
	}

	@Override
	public int updateMemberFromAdmin(MemberVO memberVo) {
		return memberDao.updateMemberFromAdmin(memberVo);
	}

	@Override
	public List<MemberVO> searchMem(String keyword) {
		return memberDao.searchMem(keyword);
	}

	@Override
	public int countMem(int deptNo) {
		return memberDao.countMem(deptNo);
	}

	@Override
	public int deleteMem(int memNo) {
		return memberDao.deleteMem(memNo);
	}

	@Override
	public MemberVO selectpositioninfo(int deptNo) {
		return memberDao.selectpositioninfo(deptNo);
	}

	@Override
	public List<Map<String, Object>> selectMemStaff(SearchVO searVo) {
		return memberDao.selectMemStaff(searVo);
	}

	@Override
	public int allMemCnt(SearchVO searchVo) {
		return memberDao.allMemCnt(searchVo);
	}

	
}
