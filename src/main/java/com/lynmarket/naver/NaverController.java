package com.lynmarket.naver;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/naver")
@Controller
public class NaverController {

	// access token 가져오기
	@ResponseBody
	@GetMapping("/redirect")
	public NaverProfileResponse naverRedirect(
			@RequestParam String code, 
			HttpSession session) {

		RestTemplate restTemplate = new RestTemplate();

		// request header 설정
		HttpHeaders headers = new HttpHeaders();
		// Content-type을 application/x-www-forn-urlencoded로 설정
		headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

		// body data 생성
		MultiValueMap<String, String> parameter = new LinkedMultiValueMap<>();
		parameter.add("grant_type", "authorization_code");
		parameter.add("client_id", "gT5IjJe8sr3XPkEy2PKl");
		parameter.add("client_secret", "81OLA_Ty5s");
		parameter.add("redirect_uri", "http://localhost:8080/naver/callback");
		parameter.add("code", code);

		// header와 body로 request 생성
		HttpEntity<MultiValueMap<String, String>> naverTokenRequest = new HttpEntity<>(parameter, headers);

		ResponseEntity<String> response = restTemplate.exchange("https://nid.naver.com/oauth2.0/token", HttpMethod.POST,
				naverTokenRequest, String.class);

		// Gson, Json Simple, ObjectMapper 라이브러리
		ObjectMapper objectMapper = new ObjectMapper();
		OAuthToken oauthToken = null;

		try {
			oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}

		// 토큰을 이용해 사용자 정보 조회
		// HttpHeader 오브젝트 생성
		HttpHeaders headers2 = new HttpHeaders();
		headers2.add("Authorization", "Bearer " + oauthToken.getAccess_token());
		headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		// HttpHeader 와 HttpBody를 하나의 오브젝트에 담기
		HttpEntity<MultiValueMap<String, String>> naverProfileRequest = new HttpEntity<>(headers2);

		// Http요청하기 - Post 방식으로-그리고 response 변수의 응답 받음
		ResponseEntity<String> response2 = restTemplate.exchange(
				"https://openapi.naver.com/v1/nid/me", 
				HttpMethod.POST,
				naverProfileRequest, 
				String.class);
		
		//Gson, Json Simple, ObjectMapper 라이브러리 
		ObjectMapper objectMapper2 = new ObjectMapper();
		NaverProfileResponse naverProfileResponse = null;
		
		try {
			naverProfileResponse  = objectMapper2.readValue(response2.getBody(), NaverProfileResponse.class);
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
		
		//user object 
		
		return naverProfileResponse;

	}
}
