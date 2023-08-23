package com.yoriwiki.spring.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardLikeVO {
	private int likeNum;  // not null number 
	private int boardNum; // not null number 
	private int userNum;  // not null number 
	private Date likeDt;   // not null date  
}