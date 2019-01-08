package com.DieboldNixdorf.ProCompta.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.DieboldNixdorf.ProCompta.dao.ReconciliationDao;
import com.DieboldNixdorf.ProCompta.model.Reconciliation;
import com.DieboldNixdorf.ProCompta.model.Transaction;
import com.DieboldNixdorf.ProCompta.model.TransactionHost;
import com.DieboldNixdorf.ProCompta.service.ReconciliationService;
import com.DieboldNixdorf.ProCompta.service.TransactionHostService;

@Controller
public class ReconciliationController {
	
	
	@Autowired 
	ReconciliationService reconciliationservice;
	
	@Autowired 
	TransactionHostService transactionHostService;
	
	@GetMapping (value = "/reconciliationTable") 
	public String goReconciliationTable(Model model) 
	{
		 
		
		
		
		
		List<Object[]> ListTransactionAndTransactionHostReconcilied = reconciliationservice.listReconciliationsTransactionAndTransactionHost();
		
		
		
		model.addAttribute("ListTransactionAndTransactionHostReconcilied",ListTransactionAndTransactionHostReconcilied);
		
		
		return "reconciliationTable";
	}
	
	@GetMapping (value = "/reconciliationJournal")  
	public String goReconciliationTableTransactionJournal(Model model) 
	{
		
		Reconciliation reconciliation = new Reconciliation();
		
		List<Transaction> listTransactionJrnNotReconcilied= reconciliationservice.listTransactionJrnNotReconcilied();
		model.addAttribute("listTransactionJrnNotReconcilied",listTransactionJrnNotReconcilied);
		
		
		model.addAttribute(reconciliation);
		return "reconciliationJournal";
	}
	
	
	@PostMapping (value = "/reconciliationJournal")  
	public String goReconciliationInsertfromTransactionJournal(
			@ModelAttribute("reconciliation") Reconciliation reconciliation , BindingResult result, Model model, RedirectAttributes redirectAttributes) 
	{
		
		 
		System.out.println("++++++++idTransaction "+reconciliation.getIdTransaction());
		System.out.println("++++++++Commenet  ; "+reconciliation.getComment());
		
		
		
		
		
		
		
		
	 
		return "reconciliationJournal";
	}
	
	
	
	
	
	@GetMapping (value = "/reconciliationHost")
	public String goReconciliationTableTransactionHost(Model model) 
	{
		
		List<TransactionHost> listTransactionHostNotReconcilied= reconciliationservice.listTransactionHostNotReconcilied();
		model.addAttribute("listTransactionHostNotReconcilied",listTransactionHostNotReconcilied);
		return "reconciliationHost";
	}

	@GetMapping("/gettransactionHost-{taransactionHostId}")
	public @ResponseBody TransactionHost gettransactionHost(@PathVariable("taransactionHostId") int taransactionHostId) 
	{
		TransactionHost trxHost  = transactionHostService.findById(taransactionHostId);
		return trxHost;
	}
	@GetMapping("/getreconciliation-{reconciliationId}")
	public @ResponseBody Reconciliation getreconciliation(@PathVariable("reconciliationId") int reconciliationId) 
	{
		Reconciliation reconciliation  = reconciliationservice.findReconciliationById(reconciliationId);
		return reconciliation;
	}
	
	
}
