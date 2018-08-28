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
	 
	
	@GetMapping("/access-denied")
	public String showAccessDeniedPage() {
		return "access-denied";
	}
	
	@GetMapping("/dashboard")
	public String GoDashboard ()
	{
		return "Empty";
	}
	


}
