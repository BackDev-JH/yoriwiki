package com.yoriwiki.spring.persistence;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.ui.Model;

import com.yoriwiki.spring.domain.BoardVO;
import com.yoriwiki.spring.domain.UserVO;
import com.yoriwiki.spring.util.Criteria;

import lombok.extern.log4j.Log4j2;

@Log4j2
@SpringBootTest
public class SearchMapperTest {

	@Autowired
	private BoardListMapper mapper;
	@Autowired
	private UsersMapper usermapper;
	
	//정보(제목, 카테고리, 조회수, 일자, 경로) 조회
	//@Test
	public void selectinfo() {
		BoardVO dto = new BoardVO();
		
		mapper.selectlist(dto);
	}
	
	//제목 기반 검색
	//@Test
	public void selectitle() {
		BoardVO dto = new BoardVO();
		
		dto.setTitle("봉골레");
		
		mapper.selecttitle(dto);
	}
	
	//내용기반 검색
	//@Test
	public void selectcontent() {
		BoardVO dto = new BoardVO();
		
		dto.setIntroduce("요");
		dto.setSource("소스");
		dto.setChoiceIngre("선택재");
		dto.setIngre("재료");
		
		mapper.selectcontent(dto);
	}
	
	//작성자기반 검색
	//@Test
	public void selectwriter() {
		UserVO udto = new UserVO();
		
		udto.setUserName("성");
		
		usermapper.selectwriter(udto);
	}
	
	//@Test
	public void end() {
		UserVO udto = new UserVO();
		
		udto.setUserName("성");
		
		usermapper.selectwriter(udto);
	}
	
	//user_num에 맞는 작성자 이름 조회
	//@Test
	public void selectWriter() {
		UserVO udto = new UserVO();
		
		udto.setUserNum(1);
		
		usermapper.selectwriter(udto);
	}

	//@Test
	public void list() {
		BoardVO dto = new BoardVO();
	
		mapper.selectlist(dto);
	}
	
	//검색 후 게시물 갯수
	@Test
	public void searchCount() {
		Criteria cri = new Criteria();
		
		cri.setType("userName");
		cri.setKeyword("현");
		
		mapper.searchTotalCount(cri);
	}
}
