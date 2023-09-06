package com.ez.ezBears.webhard.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WebHardDAO {
	List<WebHardVO> selectAllWebHard(int myBoardNo);
}
