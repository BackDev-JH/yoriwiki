package com.yoriwiki.spring.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CommentsVO {
	private int commentNum;		// not null number        
	private int userNum;		// not null number
	private String userName;
	private int boardNum;		// not null number        
	private String content;		// not null varchar2(500) 
	private String useYn;		// char(1)       
	private Date regDt;			// not null date          
	private Date modDt;			// date       
}
