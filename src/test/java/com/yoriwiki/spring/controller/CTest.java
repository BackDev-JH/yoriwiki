package com.yoriwiki.spring.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import com.yoriwiki.spring.util.Criteria;

import lombok.extern.log4j.Log4j2;

@Log4j2
@SpringBootTest
@AutoConfigureMockMvc
public class CTest {
	
	@Autowired
	private MockMvc mockMvc;
	
	@Test
	public void test() throws Exception {
		log.info("asdsad - " +
				((Criteria)mockMvc.perform(MockMvcRequestBuilders.get("/board/list/")
						)
						.andDo(print())
						.andReturn()
						.getModelAndView()
						.getModel()
						.get("cri")).getPageNum()
				);
	}

}
