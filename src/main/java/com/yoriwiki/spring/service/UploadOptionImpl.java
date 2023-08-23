package com.yoriwiki.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yoriwiki.spring.domain.UploadOptionVO;
import com.yoriwiki.spring.persistence.UploadOptionMapper;

@Service
public class UploadOptionImpl implements UploadOptionService {
	
	@Autowired
    private UploadOptionMapper mapper;

	@Override
	public UploadOptionVO getUploadOption(String id) {
		
		return mapper.getUploadOption(id);
	}

	@Override
	public void createUploadOption(UploadOptionVO uploadOption) {
		
		mapper.createUploadOption(uploadOption);
	}

	@Override
	public void updateUploadOption(UploadOptionVO uploadOption) {
		mapper.updateUploadOption(uploadOption);
		
	}

	@Override
	public void deleteUploadOption(String id) {
		mapper.deleteUploadOption(id);
		
	}

	@Override
	public void updateUploadOption1(UploadOptionVO uploadOption1) {
		mapper.updateUploadOption1(uploadOption1);
		
	}

	@Override
	public UploadOptionVO getUploadOption1(String id) {
		// TODO Auto-generated method stub
		return mapper.getUploadOption1(id);
	}

}
