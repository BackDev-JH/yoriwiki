package com.yoriwiki.spring.service;

import com.yoriwiki.spring.domain.UserVO;

public interface LoginService {
	UserVO logincount(UserVO vo);
	String findpassword(UserVO testUser);
    String findid(UserVO testUser);
    int saveUserInfo(UserVO userVO);
    int deleteUser(int userVO);
    UserVO getUserByEmail(String email);
    int PwUpdate(UserVO vo);
	
}
