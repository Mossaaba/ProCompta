package com.DieboldNixdorf.ProCompta.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

 


@Controller
public class ReplenishmentController {
	
	@RequestMapping ("/replenishment")
	public String GoReplenishmentController () {
		
		return "replenishment";
	}
	

}
