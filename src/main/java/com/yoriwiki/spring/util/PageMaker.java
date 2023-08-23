package com.yoriwiki.spring.util;

import lombok.Data;

@Data
public class PageMaker {
	
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private boolean start;
	private boolean end;
	private int displayNum; //1 2 3 4 5 6 7 8 9 10
	private int realEndPage;
	private double total;
	private Criteria cri;
	
	public PageMaker(Criteria cri, double total) {
		this.cri = cri;
		this.total = total;
		this.displayNum = 5;

		this.endPage = (int)(Math.ceil( cri.getPageNum() * 1.0 / this.displayNum )) * displayNum;
		this.startPage = endPage - (displayNum -1) ;
		
		this.realEndPage = (int)(Math.ceil( (total * 1.0) / this.cri.getAmount() ) );
		
		if(this.realEndPage < this.endPage) {
			this.endPage = realEndPage;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEndPage;
		this.start = this.startPage >1;
		this.end = this.endPage < realEndPage;
	}
}
