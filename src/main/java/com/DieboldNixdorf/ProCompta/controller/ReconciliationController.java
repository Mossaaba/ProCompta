package com.DieboldNixdorf.ProCompta.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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

 
import com.DieboldNixdorf.ProCompta.model.Reconciliation;
import com.DieboldNixdorf.ProCompta.model.Transaction;
import com.DieboldNixdorf.ProCompta.model.TransactionHost;
import com.DieboldNixdorf.ProCompta.service.ReconciliationService;
import com.DieboldNixdorf.ProCompta.service.TransactionHostService;
import com.DieboldNixdorf.ProCompta.service.TransactionService;

@Controller
public class ReconciliationController {
	
	
	@Autowired 
	ReconciliationService reconciliationservice;
	
	@Autowired
	TransactionService trxService;
	
	@Autowired 
	TransactionHostService transactionHostService;
	
	@Autowired 
	TransactionService transactionService;
	
	@GetMapping (value = "/reconciliationTable") 
	public String goReconciliationTable(Model model) 
	{
		
		model.addAttribute("reconciliation",new Reconciliation());
		
		List<Object[]> ListTransactionAndTransactionHostReconcilied = reconciliationservice.listReconciliationsTransactionAndTransactionHost();
		model.addAttribute("ListTransactionAndTransactionHostReconcilied",ListTransactionAndTransactionHostReconcilied);
		
		
		return "reconciliationTable";
	}
	
	
	
	@PostMapping (value = "/reconciliationTable") 
	public String goReconciliationTableAfterFiltring(Model model , @ModelAttribute("reconciliation") Reconciliation reconciliation , BindingResult result ) 
	{
		
		List<Object[]> ListTransactionAndTransactionHostReconcilied = reconciliationservice.listReconciliationsTransactionAndTransactionHostFilter(reconciliation);
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
		
		Transaction transaction = transactionService.findById(reconciliation.getIdTransaction());
		transaction.setFlagTransactionHost("-1");
		long millis=System.currentTimeMillis();  
		java.sql.Date date=new java.sql.Date(millis); 
		
		@SuppressWarnings("unused")
		Date dateToday = new Date();
		String timeNow = new  SimpleDateFormat("HH:mm").format(new Date());
		 
	   Reconciliation reconciliationTransactionJournal = new Reconciliation();
	   reconciliationTransactionJournal.setComment(reconciliation.getComment());
	   reconciliationTransactionJournal.setIdTransaction(reconciliation.getIdTransaction());
	   reconciliationTransactionJournal.setIdTransactionHost(0);
	   reconciliationTransactionJournal.setTypeReconciliation("Manuel");
	   reconciliationTransactionJournal.setJrnFile((transaction.getJournal().getIdjournal()).toString());
	   reconciliationTransactionJournal.setHostFile("0");
	   reconciliationTransactionJournal.setDateReconciliation(date);
	   reconciliationTransactionJournal.setTimeReconciliation(timeNow);
 
	   transactionService.updateTransaction(transaction);
	   
	   reconciliationservice.saveReconciliation(reconciliationTransactionJournal);
	   
	   redirectAttributes.addFlashAttribute("msgResultat","Reconciliation Done");
	   redirectAttributes.addFlashAttribute("DateTrx",transaction.getTransactionDateHost());
	   redirectAttributes.addFlashAttribute("cardNumber",transaction.getCardNumber() );
	   redirectAttributes.addFlashAttribute("Amount",transaction.getTransactionHostAmount() );
	   
	   redirectAttributes.addFlashAttribute("style", "success");

		return "redirect:/reconciliationJournal";
	}
	
	
	@PostMapping (value = "/reconciliationHost")  
	public String goReconciliationInsertfromTransactionHost(
			@ModelAttribute("reconciliation") Reconciliation reconciliation , BindingResult result, Model model, RedirectAttributes redirectAttributes) 
	{
		
		TransactionHost transactionhost = transactionHostService.findById(reconciliation.getIdTransactionHost());
		transactionhost.setFlagTransaction("-1");
		
		long millis=System.currentTimeMillis();  
		java.sql.Date date=new java.sql.Date(millis); 
		
		Date dateToday = new Date();
		String timeNow = new  SimpleDateFormat("HH:mm").format(dateToday);
 
		System.out.println("'''''''''''''''''''''''''''''''''''''''''''''''''"+timeNow);
	   Reconciliation reconciliationTransactionHost= new Reconciliation();
	   reconciliationTransactionHost.setComment(reconciliation.getComment());
	   reconciliationTransactionHost.setIdTransactionHost(reconciliation.getIdTransactionHost());
	   reconciliationTransactionHost.setIdTransaction(0);
	   reconciliationTransactionHost.setTypeReconciliation("Manuel");
	   reconciliationTransactionHost.setHostFile(transactionhost.getHostFile().getIdHostFile().toString());
	   reconciliationTransactionHost.setJrnFile("0");
	   reconciliationTransactionHost.setDateReconciliation(date);
	   reconciliationTransactionHost.setTimeReconciliation(timeNow);
 
	   transactionHostService.updateTransactionHost(transactionhost);
	   
	   reconciliationservice.saveReconciliation(reconciliationTransactionHost);
	   
	   redirectAttributes.addFlashAttribute("msgResultat","Reconciliation Done");
	   redirectAttributes.addFlashAttribute("DateTrx",transactionhost.getTransactionHostDate());
	   redirectAttributes.addFlashAttribute("cardNumber",transactionhost.getTransactionHostCradNumber() );
	   redirectAttributes.addFlashAttribute("Amount",transactionhost.getTransactionHostAmount() );
	   
	   redirectAttributes.addFlashAttribute("style", "success");

		return "redirect:/reconciliationHost";
	}
	
	@GetMapping (value = "/reconciliationHost")
	public String goReconciliationTableTransactionHost(Model model) 
	{
		Reconciliation reconciliation = new Reconciliation();
		model.addAttribute(reconciliation);
		
		List<TransactionHost> listTransactionHostNotReconcilied= reconciliationservice.listTransactionHostNotReconcilied();
		model.addAttribute("listTransactionHostNotReconcilied",listTransactionHostNotReconcilied);

		return "reconciliationHost";
	}
	@GetMapping("/gettransactionJrn-{taransactionHId}")
	public @ResponseBody Transaction gettransactionJrn(@PathVariable("taransactionHId") int taransactionHId) 
	{
		Transaction trx  = trxService.findById(taransactionHId);
		return trx;
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
