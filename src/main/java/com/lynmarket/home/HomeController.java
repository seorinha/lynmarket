package com.lynmarket.home;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/home")
@Controller
public class HomeController {

	@GetMapping("/home-list-view")
	public String homeListView(Model model) {
		
		model.addAttribute("viewName", "home/home");
		return "template/layout";
	}
	
}
