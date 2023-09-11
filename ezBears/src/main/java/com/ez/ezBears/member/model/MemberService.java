package com.ez.ezBears.member.model;

import java.util.List;
import java.util.Map;

import com.ez.ezBears.common.MemberSearchVO;
import com.ez.ezBears.common.SearchVO;

public interface MemberService {
	//아이디 중복확인 관련 상수
	int EXIST_ID=1;  //이미 해당 아이디가 존재함
	int NONE_EXIST_ID=2; //아이디 존재하지 않음 => 사용가능
	
	//로그인 처리 관련 상수
	int LOGIN_OK=1;  //로그인 성공
	int PWD_DISAGREE=2; //비밀번호 불일치
	int USERID_NONE=3; //해당 아이디가 존재하지 않음
	
	int selectCheckId(String memId);
	int loginCheck(String memId, String memPwd);
	
	//아이디 자동 생성
	String createMemId();
	
	//멤버 등록
	int insertMem(MemberVO memberVo);
    MemberVO getMemberById(String memId);
    void updateMember(MemberVO memberVO);
    
    //멤버 리스트
    List<MemberVO> selectAllMem(SearchVO searchVo);
    int totalList(SearchVO searchVo);
    
    //멤버 디테일
    MemberVO memberDetail(int memNo);
    
    //경영지원팀이 멤버 정보 수정
    int updateMemberFromAdmin(MemberVO memberVo);
    
    //경영지원팀에서 멤버 검색
    List<MemberVO> searchMem(String keyword);
    
    //
    int selectMemberNo(String memId);
    
    //부서 삭제시 남아있는 멤버 조회
    int countMem(int deptNo);
    
    //사원 탈퇴 처리
    int deleteMem(int memNo);
    
    //사원,스태프 전체 검색
    List<Map<String, Object>> selectMemStaff(SearchVO searchVo);
    int allMemCnt(SearchVO searchVo);
    List<Map<String, Object>> AllselectMem(SearchVO searchVo);
    
    Map<String, Object> selectMemberView(String memId);
    
    MemberVO selectpositioninfo(int deptNo);
    
    //마이페이지수정
    MemberVO selectByUserid(String memId);
    int updateMypage(MemberVO memberVo);
    int updatePwd(MemberVO memberVo);

    
    //접속한 멤버의 부서를 판별하기 위한것
    int selectDeptNo(String memId);

    //position 번호뽑기
    MemberVO memPositionNoInfo(String memId);
    

    //전체 사원 정보 리스트 
    List<Map<String, Object>> selectMemberList(SearchVO searchVo);
    List<MemberVO> selectMemberList2(SearchVO searchVo);
    int selectMemberListTotal(SearchVO searchVo);

    //모든 멤버 조회하기위해 (쪽지에서 사용)
    List<Map<String, Object>> selectAllMemberView();

    MemberVO selectDeptPositionInfo();
    

    List<MemberVO> selectAllMemberInfo();

    //본인 제외 전제 사원 검색
    List<Map<String, Object>> selectMemberList3(MemberSearchVO searchVo);
    int selectMemberListTotal3(MemberSearchVO searchVo);
    
    //전화번호 가지고오기
    List<String> selectMemTel(int deptNo);
}
