package com.DieboldNixdorf.ProCompta.controller;
import java.text.ParseException;
import java.util.Arrays;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.DieboldNixdorf.ProCompta.model.Transaction;
import com.DieboldNixdorf.ProCompta.service.TransactionService;
import com.DieboldNixdorf.ProCompta.tools.ToolsToUse;
 

 

@Controller
public class TransactionController 
{

	@Autowired
   TransactionService transactionService;
	
	@RequestMapping(value = "/transaction" ,method = RequestMethod.GET)
    public String GoTransaction(Model model , @ModelAttribute Transaction transaction , final RedirectAttributes redirectAttributes) 
	{
		populateDefaultModel(model);
		
		model.addAttribute("transaction" , new Transaction());
				
        return "TransactionFilter";
    }
		
	@GetMapping("/gettransaction-{taransactionId}")
	public @ResponseBody Transaction getTransactionDetails(@PathVariable("taransactionId") int taransactionId) {
		Transaction trx =transactionService.findById(taransactionId);
		return trx;
	}
	 
	@RequestMapping(value = "/transaction/find", method = RequestMethod.POST)
	public String getListTransactionByfilter(@ModelAttribute("transaction") @Validated Transaction transaction,
			BindingResult result, Model model, RedirectAttributes redirectAttributes) throws ParseException 
			{

		        ToolsToUse tools = new ToolsToUse();
		    
		  
		
	            List<Transaction> TrasanctionFilterList =  transactionService.listTransactionAfterFiltring(transaction);
	            
	            Iterator<Transaction> i = TrasanctionFilterList.iterator();
	            int TotalAmount = 0;
	            
	            while (i.hasNext()) 
	            {
	            	
	            	
	            	 Transaction trx = (Transaction) (i.next());
	            	
	               if (trx.getTransactionHostAmount() != null) 
	               {
	            	   TotalAmount = (int) (TotalAmount + Double.valueOf(trx.getTransactionHostAmount()) );   
	               }
	               
	               
	            	
	              

	            	
	            }
	            
	            System.out.println("Total Amount "+TotalAmount);
	            
	            
	            
	            
	            
	       	    int countTransaction = TrasanctionFilterList.size();
	            model.addAttribute("TrasanctionFilterList",TrasanctionFilterList);
		
	            
	            System.out.println("Starting date : "+transaction.getStartingDate());
	            System.out.println("Starting date : "+transaction.getStartingTime());
	            System.out.println("Starting date : "+transaction.getFinishingDate());
	            System.out.println("Starting date : "+transaction.getFinishingTime());
	            System.out.println("Part two  : "+transaction.getTransactionCardPartOne());
	            System.out.println("Part One  : "+transaction.getTransactionCardPartTwo());
	            System.out.println("Transaction Type   : "+transaction.getTransactionType());
	            System.out.println(" tarnsction hots amount mIn "+transaction.getTransactionHostAmounttMin());
	            System.out.println(" tarnsction hots amount mIn "+transaction.getTransactionHostAmountMax());
	            System.out.println(" tarnsction hots amount mIn "+transaction.getTaransaction_AUTH());
	            
	            
	            
		 
				populateDefaultModel(model);
				model.addAttribute("Filter","FilterResultat");
				model.addAttribute("Filter", "FilterTable");
				model.addAttribute("transactionFilter",transaction);
				
				
				model.addAttribute("msgResultat", "Totalité des transaction");
				model.addAttribute("countTransaction", countTransaction);
				model.addAttribute("TotalAmount", TotalAmount);
				
				
				model.addAttribute("css" , "primary");
				
				
				
				
				
				
			    return "TransactionFilter";
		 

	}
	
	
	
	private void populateDefaultModel(Model model)
	{
		
		
		List<String> listATM =  transactionService.listATM();
		model.addAttribute("listATM", listATM);
		List<String> errorsTransaction =  transactionService.listErreursTransaction();
		model.addAttribute("errorsTransaction", errorsTransaction);	
		 
	}
	
     
}
