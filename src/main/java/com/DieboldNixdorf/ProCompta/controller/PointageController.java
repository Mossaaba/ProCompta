package com.DieboldNixdorf.ProCompta.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

 


@Controller
public class PointageController {
	
	@RequestMapping ("/pointage")
	public String GoPointage () {
		
		return "pointage";
	}
	

}
