package com.ez.ezBears.member.model;

import java.util.List;
import java.util.Map;

import com.ez.ezBears.staff.model.StaffVO;

import lombok.Data;

@Data
public class MemberListVO {
	
	private MemberVO memberVo; // member
	private StaffVO staffVo; // staff
	
}
