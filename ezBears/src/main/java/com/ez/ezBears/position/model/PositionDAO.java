package com.ez.ezBears.position.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PositionDAO {
	List<PositionVO> selectPositionList();
}
