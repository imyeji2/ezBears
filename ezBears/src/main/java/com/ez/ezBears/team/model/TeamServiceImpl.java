package com.ez.ezBears.team.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TeamServiceImpl implements TeamService{
	public final TeamDAO teamDao;
	
}
