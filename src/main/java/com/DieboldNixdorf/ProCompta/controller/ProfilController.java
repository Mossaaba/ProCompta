package com.DieboldNixdorf.ProCompta.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProfilController {
	
	@RequestMapping ("/profil")
	public String GoProfil ()   {
		 
		return "profil";
	}
	
	@RequestMapping ("/login")
	public String GoHome () {
		
		return "login";
	}
	@RequestMapping ("/")
	public String GoHomeFromApp () {
		
		return "login";
	}
	  
 
}
