package com.DieboldNixdorf.ProCompta.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

 


@Controller
public class DayController {
	
	@RequestMapping ("/day")
	public String GoDay () {
		
		return "day";
	}
	

}
