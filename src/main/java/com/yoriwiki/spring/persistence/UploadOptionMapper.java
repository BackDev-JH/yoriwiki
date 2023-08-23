package com.yoriwiki.spring.persistence;

import org.apache.ibatis.annotations.Mapper;

import com.yoriwiki.spring.domain.UploadOptionVO;

@Mapper
public interface UploadOptionMapper {

	UploadOptionVO getUploadOption(String id);
    void createUploadOption(UploadOptionVO uploadOption);
    void updateUploadOption(UploadOptionVO uploadOption);
    void updateUploadOption1(UploadOptionVO uploadOption1);
    void deleteUploadOption(String id);
	UploadOptionVO getUploadOption1(String id);
}
