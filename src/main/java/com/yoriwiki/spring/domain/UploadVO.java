package com.yoriwiki.spring.domain;

import lombok.Data;

@Data
public class UploadVO {
	private String id;                  
	private int maxSize;                     
	private String allowedExtensions; 
	private int maxUploadCount;          
}
