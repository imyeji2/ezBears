package com.ez.ezBears.webhard.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class WebHardServiceImpl implements WebHardService{
	private final WebHardDAO webHardDao;

	@Override
	public List<WebHardVO> selectAllWebHard(int myBoardNo) {
		return webHardDao.selectAllWebHard(myBoardNo);
		
	}
	
	
	
}
