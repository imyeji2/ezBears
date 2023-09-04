package com.ez.ezBears.member.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ez.ezBears.common.SearchVO;

@Mapper
public interface MemberDAO {
	int selectCheckId(String memId);
	String selectPwd(String memId);
	
	//자동 아이디 생성 관리 
    int getTodayMem(String contractStart);
    int isMemId(String memId);
    
    //멤버 등록
    int insertMem(MemberVO memberVo);
    MemberVO getMemberById(String memId);
    void updateMember(MemberVO memberVO);
    
    //멤버 리스트
    List<MemberVO> selectAllMem(SearchVO searchVo);
    int totalList(SearchVO searchVo);
    
    //회원 아이디로 회원 번호 검색하기
    int selectMemberNo(String memId);
    
    //멤버 번호로 멤버 정보 조회하기
    MemberVO memberDetail(int memNo);
    
    //경영지원팀이 멤버 정보 수정
    int updateMemberFromAdmin(MemberVO memberVo);
    
    //경영지원팀에서 멤버 검색
    List<MemberVO> searchMem(String keyword);
    
    //부서 삭제시 남아있는 멤버 조회
    int countMem(int deptNo);
    
    //사원 탈퇴 처리
    int deleteMem(int memNo);
    
    Map<String, Object> selectMemberView(String memId);
    
    //각 부서별 결재 담당자출력
    MemberVO selectpositioninfo(int deptNo);
  
    
    //마이페이지 수정
    MemberVO selectByUserid(String memId);
    int updateMypage(MemberVO memberVo);
    int updatePwd(MemberVO memberVo);
    

    //사원,스태프 전체 검색
    List<Map<String, Object>> selectMemStaff(SearchVO searVo);
    int allMemCnt(SearchVO searchVo);
}
