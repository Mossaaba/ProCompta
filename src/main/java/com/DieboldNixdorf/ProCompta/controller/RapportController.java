package com.DieboldNixdorf.ProCompta.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

 


@Controller
public class RapportController {
	
	@RequestMapping ("/rapport")
	public String GoRapportController () {
		
		return "rapport";
	}
	

}
