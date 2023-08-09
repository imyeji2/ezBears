package com.ez.ezBears.dept.model;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class DeptServiceImpl implements DeptService{
	private final DeptDAO dao;
}
