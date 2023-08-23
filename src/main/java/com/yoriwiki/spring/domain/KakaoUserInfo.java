package com.yoriwiki.spring.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class KakaoUserInfo {
	
	private String email; 
	private String nickname;
}
