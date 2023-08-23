package com.yoriwiki.spring.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yoriwiki.spring.domain.UserVO;
import com.yoriwiki.spring.persistence.SignUpMapper;




@Service
public class SignUpServiceImpl implements SignUpService{
	
	@Autowired
	private SignUpMapper mapper;
	
	@Override
	public int signupcount(UserVO testUser) {
				
		return mapper.signupcount(testUser);
	}

	@Override
	public UserVO findById(UserVO vo) {
		// TODO Auto-generated method stub
		return mapper.findById(vo);
	}

	@Override
	public UserVO findByName(UserVO vo) {
		// TODO Auto-generated method stub
		return mapper.findByName(vo);
	}

	@Override
	public UserVO findByEmail(UserVO vo) {
		// TODO Auto-generated method stub
		return mapper.findByEmail(vo);
	}

	@Override
	public UserVO findByPhone(UserVO vo) {
		// TODO Auto-generated method stub
		return mapper.findByPhone(vo);
	}


}
