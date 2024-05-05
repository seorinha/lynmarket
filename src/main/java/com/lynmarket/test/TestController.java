package com.lynmarket.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {

	@Autowired
	PostMapper postMapper;
	
	@ResponseBody
	@RequestMapping("/test1")
	public String helloWorld() {
		return "Hello world!";
	}

	@RequestMapping("/test/test2") // jsp 연동
	public String test2() {
		return "test/test2";
	}

	@ResponseBody
	@GetMapping("/test3") // json 
	public Map<String, Object> test3() {
		Map<String, Object> map = new HashMap<>();
		map.put("a", 1);
		map.put("b", 20);
		return map;
	}

	@GetMapping("test/test4")
	public List<Map<String, Object>> test4() {
		return postMapper.selectPostList();
	}
	
}
