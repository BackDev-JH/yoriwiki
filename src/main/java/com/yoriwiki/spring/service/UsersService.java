package com.yoriwiki.spring.service;

import java.util.List;

import com.yoriwiki.spring.domain.UserVO;

public interface UsersService {
	
	/* public List<UsersVO> selectWriter(UsersVO dto); */
	
	public List<UserVO> selectWriter(UserVO dto);

}
