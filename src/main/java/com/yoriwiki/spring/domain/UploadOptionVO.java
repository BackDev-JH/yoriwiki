package com.yoriwiki.spring.domain;

import lombok.Data;

@Data
public class UploadOptionVO {

	
	private String id;
	private int maxSize;
	private String allowedExtensions;
	private int maxUploadCount;
	private int videoMaxSize;
	private String videoAllowedExtensions;
	private int videoMaxUploadCount;
}
