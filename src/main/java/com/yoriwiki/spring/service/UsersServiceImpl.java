package com.yoriwiki.spring.service;

import java.util.List;

import org.springframework.stereotype.Service;


import com.yoriwiki.spring.domain.UserVO;
import com.yoriwiki.spring.persistence.UsersMapper;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
@RequiredArgsConstructor
public class UsersServiceImpl implements UsersService{
	
	private final UsersMapper mapper;
	
	/*
	 * @Override public List<UsersVO> selectWriter(UsersVO dto) { return
	 * mapper.selectwriter(dto); }
	 */
	
	@Override
	public List<UserVO> selectWriter(UserVO udto) {
		return mapper.selectwriter(udto);
	}
}
