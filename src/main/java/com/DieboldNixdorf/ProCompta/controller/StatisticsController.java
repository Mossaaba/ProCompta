package com.DieboldNixdorf.ProCompta.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

 
@Controller
public class StatisticsController {
	
	@RequestMapping ("/statistics")
	public String GoStatisticsController () {
		
		return "statistics";
	}
	
	@RequestMapping ("/statistics/ajax_test")
	@ResponseBody
	public String getServerTime()  
	 {
		System.out.println("-------------getServerTime()-------------");
		String hola ="ajax";
		return hola;
	 
	 }
		
		
}
