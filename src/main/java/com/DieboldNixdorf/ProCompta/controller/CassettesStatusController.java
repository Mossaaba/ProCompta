package com.DieboldNixdorf.ProCompta.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

 


@Controller
public class CassettesStatusController {
	
	@RequestMapping ("/cassettesStatus")
	public String GoCassettesStatus () {
		
		return "cassettesStatus";
	}
	

}
