package com.ez.ezBears.team.model;

import lombok.Data;

@Data
public class TeamVO {
	private int playerNo; /*선수 번호*/  
	private int positionNo;	/*포지션 번호*/
	private int deptNo;	/*부서 번호*/
	private int backNo;	/*등 번호*/
	private String playerName; /*선수 이름*/     
	private String playerBirth; /*선수 생일*/
	private int height; /*선수 키*/
	private int weight; /*선수 몸무게*/
	private int playerSal; /*선수 연봉*/
	private String contractStart; /*계약 시작일*/
	private String contractDone; /*계약 만료일*/
	private String playerTel; /*선수 전화번호*/
	private String playerInfo; /*선수 특이사항*/
	private String playerStatus; /*선수 상태(1군 2군 부상여부 등)*/
	private String playerAddress; /*선수 주소*/
	private String playerAddressDetail; /*선수 주소 상세*/
	private String playerZipcode; /*선수 우편번호*/
	private String playerImage; /*선수 이미지*/
}
