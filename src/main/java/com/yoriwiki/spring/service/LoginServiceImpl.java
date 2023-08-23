package com.yoriwiki.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yoriwiki.spring.domain.UserVO;
import com.yoriwiki.spring.persistence.LoginMapper;

@Service
public class LoginServiceImpl implements LoginService{

	@Autowired
	private LoginMapper mapper;
	
	@Override
	public UserVO logincount(UserVO vo) {
				
		return mapper.logincount(vo);
	}

	@Override
	public String findpassword(UserVO testUser) {
		
		return mapper.findpassword(testUser);
	}

	@Override
	public String findid(UserVO testUser) {
		
		return mapper.findid(testUser);
	}

	@Override
	public int saveUserInfo(UserVO userVO) {
		
		return mapper.saveUserInfo(userVO);	
	}

	@Override
	public int deleteUser(int userVO) {
		
		return mapper.deleteUser(userVO);
	}	

	@Override
	public UserVO getUserByEmail(String email) {
		
		return mapper.getUserByEmail(email);
	}

	@Override
	public int PwUpdate(UserVO vo) {
		// TODO Auto-generated method stub
		return mapper.PwUpdate(vo);
	}

	

}
