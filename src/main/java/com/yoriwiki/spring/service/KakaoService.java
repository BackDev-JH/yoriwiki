package com.yoriwiki.spring.service;

import com.yoriwiki.spring.domain.KakaoUserInfo;

public interface KakaoService {
	String getAccessToken(String code) throws Exception;
	KakaoUserInfo getUserInfo(String accessToken) throws Exception;
}
