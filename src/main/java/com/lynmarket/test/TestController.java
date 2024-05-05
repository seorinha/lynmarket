package com.lynmarket.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {

	@ResponseBody
	@RequestMapping("/test1")
	public String helloWorld() {
		return "Hello world!";
	}
	
	 @RequestMapping("/test/test2") //jsp 연동
	    public String test2() {  
	        return "test/test2"; 
	    }
	
	 
}
