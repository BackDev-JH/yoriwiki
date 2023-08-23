package com.yoriwiki.spring.persistence;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.yoriwiki.spring.domain.BoardVO;
import com.yoriwiki.spring.util.Criteria;

import lombok.extern.log4j.Log4j2;

@Log4j2
@SpringBootTest
public class PageMapperTest {

	@Autowired
	private BoardListMapper mapper;
//	@Autowired
//	private UsersMapper usermapper;
	
	//검색 조건에 따른 페이징처리
	@Test
	public void testSearch() {
		
		Criteria cri = new Criteria();
		
		cri.setKeyword("현");
		cri.setType("userName");
		
		List<BoardVO> list = mapper.searchListByPaging(cri);
		list.forEach(board -> log.info(board));
	}
}
