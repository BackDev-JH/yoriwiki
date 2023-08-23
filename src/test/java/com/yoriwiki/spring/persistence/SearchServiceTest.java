package com.yoriwiki.spring.persistence;

import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;

import com.yoriwiki.spring.domain.BoardVO;
import com.yoriwiki.spring.domain.UserVO;

import lombok.extern.log4j.Log4j2;

@Log4j2
@SpringBootTest
@AutoConfigureMockMvc
public class SearchServiceTest {
	
	//@Autowired
	//private BoardListService boardservice;
	/*
	 * @Autowired private UsersService userservice;
	 */
	
	//정보(제목, 카테고리, 조회수, 일자, 경로) 조회
	//@Test
	public void selectinfo() {
		BoardVO dto = new BoardVO();
		
		/* boardservice.selectList(dto); */
		
		//log.info("boardservice - " + boardservice.selectList(dto));
	}
	
	/*
	 * //제목 기반 검색 //@Tesㅁ public void selectitle() { BoardVO dto = new BoardVO();
	 * 
	 * dto.setTitle("봉골레");
	 * 
	 * boardservice.selectTitle(dto); }
	 * 
	 * //내용기반 검색 //@Test public void selectcontent() { BoardVO dto = new BoardVO();
	 * 
	 * dto.setIntroduce("요"); dto.setSource("소스"); dto.setChoiceIngre("선택재");
	 * dto.setIngre("재료");
	 * 
	 * boardservice.selectContent(dto); }
	 */
	
	//작성자기반 검색
	//@Test
	public void selectwriter() {
		UserVO udto = new UserVO();
		
		udto.setUserName("성");
		
		/* userservice.selectWriter(udto); */
	}
	
	/*
	 * @Autowired private JoinService joinservice;
	 * 
	 * @Test public void getJoin( ) { MemberDTO dto = new MemberDTO();
	 * 
	 * dto.setUser_id("yh123"); dto.setUser_password("asya");
	 * dto.setUser_name("야호"); dto.setCall_num("010-6231-0012");
	 * dto.setEmail("yaho@naver.com");
	 * 
	 * joinservice.userJoin(dto);
	 * 
	 * log.info("service join - " + joinservice.userJoin(dto)); }
	 */

}
