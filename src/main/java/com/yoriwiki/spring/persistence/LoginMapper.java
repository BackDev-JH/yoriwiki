package com.yoriwiki.spring.persistence;


import org.apache.ibatis.annotations.Mapper;

import com.yoriwiki.spring.domain.UserVO;

@Mapper
public interface LoginMapper {
	
	 UserVO logincount(UserVO vo);
	    String findpassword(UserVO testUser);
	    String findid(UserVO testUser);
	    
	    int saveUserInfo(UserVO userVO);
	    int deleteUser(int userVO);
	    UserVO getUserByEmail(String email);
	    int PwUpdate(UserVO vo);
   
}
