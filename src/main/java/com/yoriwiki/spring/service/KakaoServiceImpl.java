package com.yoriwiki.spring.service;


import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.yoriwiki.spring.domain.KakaoUserInfo;


@Service
public class KakaoServiceImpl implements KakaoService{

	@Override
	public String getAccessToken(String code) throws Exception {
	  // 카카오 API를 호출하여 인가 코드로부터 액세스 토큰을 발급받습니다.
	  String apiUrl = "https://kauth.kakao.com/oauth/token";
	  RestTemplate restTemplate = new RestTemplate();
	  HttpHeaders headers = new HttpHeaders();
	  headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
	  MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
	  params.add("grant_type", "authorization_code");
	  params.add("client_id", "4fa8b442b89754a29008580b23ee48fe");
	  params.add("redirect_uri", "http://172.20.10.53:8890/login/kakao");
	  params.add("code", code);
	  HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);
	  ResponseEntity<String> responseEntity = restTemplate.exchange(apiUrl, HttpMethod.POST, kakaoTokenRequest, String.class);
	  ObjectMapper objectMapper = new ObjectMapper();
	  JsonNode rootNode = objectMapper.readTree(responseEntity.getBody());
	  return rootNode.get("access_token").asText();
	}

	@Override
	public KakaoUserInfo getUserInfo(String accessToken) throws Exception {
	  // 액세스 토큰으로 인증된 사용자 정보를 조회합니다.
	  String apiUrl = "https://kapi.kakao.com/v2/user/me";
	  RestTemplate restTemplate = new RestTemplate();
	  HttpHeaders headers = new HttpHeaders();
	  headers.add("Authorization", "Bearer " + accessToken);
	  headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
	  HttpEntity<?> kakaoProfileRequest = new HttpEntity<>(headers);
	  ResponseEntity<String> responseEntity = restTemplate.exchange(apiUrl, HttpMethod.GET, kakaoProfileRequest, String.class);
	  ObjectMapper objectMapper = new ObjectMapper();
	  JsonNode rootNode = objectMapper.readTree(responseEntity.getBody());
	  String email = rootNode.path("kakao_account").path("email").asText();	  
	  String nickname = rootNode.path("kakao_account").path("profile").path("nickname").asText();	
	  return new KakaoUserInfo(email, nickname);
	}

}
