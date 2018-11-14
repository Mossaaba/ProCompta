package com.DieboldNixdorf.ProCompta.controller;
 
 
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
 

 


@Controller
public class AdministrationController 
{

	@RequestMapping ("/administration")
	public String GoAdministration () 
	{
		return "administration";
	}
	
	
	
	

	 
}
