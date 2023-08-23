package com.yoriwiki.spring.persistence;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import lombok.extern.log4j.Log4j2;

@Log4j2
@SpringBootTest
@AutoConfigureMockMvc
public class SearchControllerTest {
	
	@Autowired
	private MockMvc mockMvc;
	
	//@Test
	public void testExit() {
		log.info(mockMvc);
	}
	
	//@Test
	public void test() throws Exception {
		log.info("selectinfo - " +
				mockMvc.perform(MockMvcRequestBuilders.get("/board/main/")
						)
						.andReturn()
						.getModelAndView()
						
				);
	}
	
	//@Test
	public void index() throws Exception {
		log.info("selectitle - " +
				mockMvc.perform(MockMvcRequestBuilders.get("/board/main/")
						.param("title", "봉골레"))
						.andReturn()
						.getModelAndView()
						.getModelMap()
						.get("BoardVO")
				);
	}
}