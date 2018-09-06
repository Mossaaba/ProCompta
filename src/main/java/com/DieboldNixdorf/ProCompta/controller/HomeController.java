package com.DieboldNixdorf.ProCompta.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	
	
	@GetMapping("/")
	public String GoHome ()
	{
		return "home";
	}

	@GetMapping("/dashboard")
	public String GoDashboard ()
	{
		return "Empty";
	}
	


}
