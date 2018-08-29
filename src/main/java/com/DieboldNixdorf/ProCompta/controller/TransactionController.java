package com.DieboldNixdorf.ProCompta.controller;


import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.DieboldNixdorf.ProCompta.model.Transaction;
import com.DieboldNixdorf.ProCompta.service.TransactionService;
import com.DieboldNixdorf.ProCompta.validator.TransactionFormValidator;

 

@Controller
public class TransactionController 
{
	
	@Autowired
	TransactionFormValidator transactionFormValidator;
 
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(transactionFormValidator);
	}
	
	private TransactionService transactionService;

	@Autowired
	public void setTransactionService(TransactionService thetransactionService) {
		this.transactionService = thetransactionService;
	}
	
	
	@RequestMapping(value = "/transaction" ,method = RequestMethod.GET)
    public String GoTransaction(Model model , @ModelAttribute Transaction transaction , final RedirectAttributes redirectAttributes) 
	{

		 
		model.addAttribute("css" , "complete");
		populateDefaultModel(model);
		model.addAttribute("transaction" , new Transaction());
				
        return "Transaction";
    }
		
		
	
	private void populateDefaultModel(Model model)
	{

		List<String> etatsCash = new LinkedList<>(Arrays.asList(new String[] {}));
		for(int i=0;i<transactionService.listCardState().size();i++)
		{
			etatsCash.add(transactionService.listCashState().get(i));
		}
		model.addAttribute("etatsCash", etatsCash);

		 
		List<String> etatscarte = new LinkedList<>(Arrays.asList(new String[] { }));
		for(int i=0;i<transactionService.listCardState().size();i++)
		{
			etatscarte.add(transactionService.listCardState().get(i));
		}
		model.addAttribute("etatscarte", etatscarte);
 
		
		List<String> errorsTransaction = new LinkedList<>(Arrays.asList(new String[] {}));
		for(int i=0;i<transactionService.listErreurs().size();i++)
		{
			errorsTransaction.add(transactionService.listErreurs().get(i));
		}
		model.addAttribute("errorsTransaction", errorsTransaction);	 
	}
	
	 
	@RequestMapping(value = "/transaction/find", method = RequestMethod.POST)
	public String getListTransactionByfilter(@ModelAttribute("transaction") @Validated Transaction transaction,
			BindingResult result, Model model, RedirectAttributes redirectAttributes) throws ParseException 
			{

		 
			if (result.hasErrors())
			 {
				populateDefaultModel(model);
				
				model.addAttribute("msg", "Vérfier les donées saisies SVP");
				model.addAttribute("css" , "danger");
				
				return "Transaction";
			} 
			else 
			{
				populateDefaultModel(model);
				
				String dateStart = transaction.getDebuttransactionDate();
			    String dateFinish = transaction.getFintransactionDate(); 		
			    Time startingTimeTransaction = transaction.getHeuredebut();
			    Time fnisgingTimeTransaction = transaction.getHeurefin();
			    String cardNumber = transaction.getNumerocarte();
			    String CradState = transaction.getEtatcarte();
			    long montant  = transaction.getMontant();
			    String etatcash = transaction.getEtatcash();
			    String errorTransaction = transaction.getRemarque();
			    String numberAuthorisatin = transaction.getNauthorisation();
			    long MinAmount = transaction.getMontantMin();
			    long MaxAmount = transaction.getMontantMax();
			    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		        java.util.Date parsed = format.parse(dateStart);
		        java.util.Date parsed2 = format.parse(dateFinish);  
		        java.sql.Date DebuttransactionDate = new java.sql.Date(parsed.getTime());
		        java.sql.Date fintransactionDate = new java.sql.Date(parsed2.getTime());
		        
                model.addAttribute("ListTransactionAfterFiltring" ,transactionService.listTransactionByFilter(DebuttransactionDate ,
						fintransactionDate , startingTimeTransaction , fnisgingTimeTransaction , cardNumber ,  CradState  ,  
						montant , etatcash  , numberAuthorisatin  , errorTransaction , MinAmount  , MaxAmount ));
				
				model.addAttribute("msg", "Totalité des transaction");
				model.addAttribute("css" , "success");
				
				
				
			    return "Transaction";
		}

	}
	
	
     
}
