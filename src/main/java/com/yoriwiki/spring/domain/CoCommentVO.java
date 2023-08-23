package com.yoriwiki.spring.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CoCommentVO {
	private int cocommentNum; 	// not null number        
	private int userNum;
	private String userName;
	private int commentNum;    // not null number        
	private String content;     // not null varchar2(500) 
	private String useYn;      // not null varchar2(1)   
	private Date regDt;        // not null date          
	private Date modDt;        // date        
}
