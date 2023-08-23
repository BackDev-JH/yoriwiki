package com.yoriwiki.spring.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.yoriwiki.spring.domain.UserVO;

@Mapper
public interface UsersMapper {
	/* public List<UsersVO> selectwriter(UserVO udto); */
	
	public List<UserVO> selectwriter(UserVO udto);

}
