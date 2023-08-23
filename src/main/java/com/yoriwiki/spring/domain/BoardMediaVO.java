package com.yoriwiki.spring.domain;

import lombok.Data;

@Data
public class BoardMediaVO {
	private int mediaNum;		// not null number        
	private int boardNum;		// not null number        
	private String fileName;		// not null varchar2(50)  
	private String path;		// not null varchar2(200) 
	private int step;			// number        
	private int orderNo;		// number        
	private String content;		// varchar2(300)
	private int gubun;
	
	/* step 0  -> 메인
	 * 메인은 orderNo 1부터 증가 (순서)
	 * 
	 * 본문은 step 1부터 증가
	 * orderNo = 1 or 0 or null
	 * 
	 */
	
}
