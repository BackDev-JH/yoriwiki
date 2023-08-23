package com.yoriwiki.spring.service;

import com.yoriwiki.spring.domain.UserVO;

public interface SignUpService {
	
	int signupcount(UserVO testUser);
	UserVO findById(UserVO vo);

	UserVO findByName(UserVO vo);

	UserVO findByEmail(UserVO vo);

	UserVO findByPhone(UserVO vo);
}
