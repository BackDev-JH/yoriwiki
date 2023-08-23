package com.yoriwiki.spring.util;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class Criteria {
	private int pageNum; // 내가 클릭한 페이지 넘버
	private int amount; // 읽어올 갯수
    private String type;
    private String keyword;
    private String order;
    private String category;
    private String name;
	
	  public Criteria() {
		  this(1,10);
	  }

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	/*
	 * public String[] getTypeArr() {
	 * 
	 * return type ==null? new String[] {}:type.split(""); }
	 * tc면 t,c로 잘라 배열로 생성 */

}
