package com.DieboldNixdorf.ProCompta.controller;

 
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.DieboldNixdorf.ProCompta.model.Bank;
import com.DieboldNixdorf.ProCompta.service.BankService;
import com.DieboldNixdorf.ProCompta.validator.UserFormValidator;



@Controller 
@RequestMapping("bank")
public class BankController {
	
	
	
	@Autowired
	BankService bankService;
	
	 
	@Autowired
	MessageSource messageSource;

	 
	@Autowired
	UserFormValidator userFormValidator;
 
	
 
	
 
	@RequestMapping("/list")
	public String listBank(ModelMap model) {

		
		List<Bank> banks = bankService.getAllBanks();
		 model.addAttribute("banks", banks);

		 Bank bank = new Bank();
		 model.addAttribute("bank" ,bank );
		 
		return "bank";
	}

	@PostMapping("/list")
	public String saveBank(ModelMap model , @ModelAttribute("bank") Bank bank) 
	{
		bankService.saveBank(bank);
		return "redirect:/bank/list";
    }  
	
	
	@GetMapping("/edit-bank-{idBank}") 
	public String editBank(@PathVariable int idBank, ModelMap model) 
	{
		
		List<Bank> banks = bankService.getAllBanks();
		 model.addAttribute("banks", banks);
		 
		Bank bank = bankService.findById(idBank);
		model.addAttribute("banks", banks);
		model.addAttribute("bank", bank);
		model.addAttribute("edit", true);
		model.addAttribute("editUser", "editUser");
		 
		
		return "bank";
	}
	
	@PostMapping("/edit-bank-{idBank}")
	public String editBankforSavig (ModelMap model , @ModelAttribute("bank") Bank bank ) {
		
		bankService.saveBank(bank);
		return "redirect:/bank/list";
	}
	
	@GetMapping("/delete-bank-{idBank}")
	public String DeleteBank(@PathVariable int idBank) 
	{
	
        bankService.deleteBankById(idBank);
		return "redirect:/bank/list";
    }  
	
	

}
