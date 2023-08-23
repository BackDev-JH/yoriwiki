package com.yoriwiki.spring.service;

import com.yoriwiki.spring.domain.UploadOptionVO;

public interface UploadOptionService {
	
	UploadOptionVO getUploadOption(String id);
    void createUploadOption(UploadOptionVO uploadOption);
    void updateUploadOption(UploadOptionVO uploadOption);
    void deleteUploadOption(String id);
	void updateUploadOption1(UploadOptionVO uploadOption1);
	UploadOptionVO getUploadOption1(String id);
	
}
