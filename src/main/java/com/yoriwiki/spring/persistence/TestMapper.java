package com.yoriwiki.spring.persistence;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface TestMapper {
	@Select("SELECT sysdate FROM dual")
	public String getTime();
	@Select("SELECT sysdate FROM dual")
	public String getTime2();
}
