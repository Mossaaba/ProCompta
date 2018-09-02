package com.DieboldNixdorf.ProCompta.controller;

import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.DieboldNixdorf.ProCompta.model.Atm;
import com.DieboldNixdorf.ProCompta.service.AtmService;

@Controller
@RequestMapping("Atm")
public class AtmController {
	

	@Autowired 
	private AtmService atmService;
	
	@RequestMapping("/list")
	public String listAtm(Model theModel)
	{
		
		List<Atm> listAtms = atmService.listAtms();
		populateDefaultModel(theModel);
		Atm atm = new Atm();
		theModel.addAttribute("atm", atm);
		theModel.addAttribute("listAtms",listAtms);
		
		return "AtmCreation";
	}
	
	
	
	@GetMapping ("/CreationNewAtm")
	public String GoCreateAtm (Model theModel) 
	{
		
		Atm atm = new Atm();
		theModel.addAttribute("atm", atm);
		populateDefaultModel(theModel);
		
		 
		return "AtmCreation";
	}
	
	
	
	private void populateDefaultModel(Model model)
	{

		List<String> ListVendors = new LinkedList<>(Arrays.asList(new String[] {"NCR", "DIEBOLD" ,"WINCOR"}));
		 
		model.addAttribute("ListVendors", ListVendors);

		 
		List<String> etatscarte = new LinkedList<>(Arrays.asList(new String[] { }));
		 
		model.addAttribute("etatscarte", etatscarte);
 
		
		List<String> errorsTransaction = new LinkedList<>(Arrays.asList(new String[] {}));
		 
		model.addAttribute("errorsTransaction", errorsTransaction);	 
	}

}
