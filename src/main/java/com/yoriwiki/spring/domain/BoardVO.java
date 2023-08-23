package com.yoriwiki.spring.domain;

import lombok.Data;

@Data
public class BoardVO {
   private int boardNum;        // not null number        
   private int userNum;         // not null number        
   private String category;     // varchar2(20)  
   private String title;        // not null varchar2(100) 
   private String introduce;    // not null varchar2(200) 
   private String time;         // varchar2(8)   
   private String diff;         // varchar2(8)   
   private String source;   	// varchar2(100) 
   private String ingre;        // varchar2(200) 
   private String choiceIngre;	// varchar2(100) 
   private String src;          // varchar2(200) 
   private int hit;         	// not null number        
   private String yna;          // char(1)       
   private String regDt;          // not null date          
   private String modDt;          // date          
   private String userName;
   private String path;
   private String name;
   private int commentCnt;   	// not null number        
}
