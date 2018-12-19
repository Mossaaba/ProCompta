package com.DieboldNixdorf.ProCompta.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TransactionFilter {
	
	
	@RequestMapping("transactionFilter")
	public String transactionFilter(Model model) {
		
		
		
		return"TransactionFilter";
	}
	
	

}
