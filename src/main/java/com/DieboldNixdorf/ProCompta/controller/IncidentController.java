package com.DieboldNixdorf.ProCompta.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

 


@Controller
public class IncidentController {
	
	@RequestMapping ("/maintenance")
	public String GoMaintenanceController () {
		
		return "maintenance";
	}
	

}
