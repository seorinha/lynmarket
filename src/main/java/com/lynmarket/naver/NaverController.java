package com.lynmarket.naver;

import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;

public class NaverController {

	@RequestMapping("/naver_login")
	public String naver_login(HttpServletRequest request) {
	    String client_id = "gT5IjJe8sr3XPkEy2PKl";
	    String redirect_uri = "http://localhost:8080/naver/callback";
	    String state = "STATE";
	    String login_url = "https://nid.naver.com/oauth2.0/authorize?response_type=code"
	            + "&client_id=" + "gT5IjJe8sr3XPkEy2PKl"
	            + "&redirect_uri=" + "http://localhost:8080/naver/callback"
	            + "&state=" + state;

	    request.getSession().setAttribute("state", state);

	    return "redirect:" + login_url;
	} 
}
