package com.ez.ezBears.member.model;

import java.util.List;
import java.util.Map;

import com.ez.ezBears.staff.model.StaffVO;

import lombok.Data;

@Data
public class MemberListVO {
	
	private MemberVO memberVo; // member
	private StaffVO staffVo; // member
	
	private List<Map<String, Object>> MemberListVO; //view에서 가지고 온거 담을거
}
