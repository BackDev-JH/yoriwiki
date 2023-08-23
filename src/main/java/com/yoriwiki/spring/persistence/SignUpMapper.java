package com.yoriwiki.spring.persistence;

import org.apache.ibatis.annotations.Mapper;

import com.yoriwiki.spring.domain.UserVO;

@Mapper
public interface SignUpMapper {
	
	int signupcount(UserVO testUser);
	UserVO findById(UserVO vo);

	UserVO findByName(UserVO vo);

	UserVO findByEmail(UserVO vo);

	UserVO findByPhone(UserVO vo);
}
