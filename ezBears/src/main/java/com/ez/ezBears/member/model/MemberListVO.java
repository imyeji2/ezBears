package com.ez.ezBears.member.model;

import java.util.List;
import java.util.Map;

import lombok.Data;

@Data
public class MemberListVO {
	
	private MemberVO memberVo; // member
	
	private List<Map<String, Object>> memberDetailList; //view에서 가지고 온거 담을거
}
