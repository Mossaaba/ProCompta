package com.DieboldNixdorf.ProCompta.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

 


@Controller
public class ConfrontationController {
	
	@RequestMapping ("/confrontation")
	public String GoConfrontation () {
		
		return "confrontation";
	}
	

}
