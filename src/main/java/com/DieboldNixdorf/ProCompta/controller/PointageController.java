package com.DieboldNixdorf.ProCompta.controller;

import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.DieboldNixdorf.ProCompta.model.Reconciliation;
import com.DieboldNixdorf.ProCompta.service.ReconciliationService;

 


@Controller
public class PointageController {
	
	@Autowired
	ReconciliationService reconciliationService;
	
	
	
	@RequestMapping(value = "/pointage" ,method = RequestMethod.GET)
    public String GoPointage(Model model , @ModelAttribute Reconciliation reconciliation , final RedirectAttributes redirectAttributes) 
      	{
 
		model.addAttribute("css" , "complete");
		model.addAttribute("incident" , new Reconciliation());
				
        return "tally";
          }
	
	
	
	@RequestMapping(value = "/pointage/perform", method = RequestMethod.POST)
	public String performReconciliation(@ModelAttribute("reconciliation") @Validated Reconciliation reconciliation,
			BindingResult result, Model model, RedirectAttributes redirectAttributes) throws ParseException 
			{
		
		
		List<Object[]> listTransaction  = reconciliationService.listReconciliationsAfterFiltring();
		  for (Object[] row : listTransaction) 
		  {
				 
			  
			  
			  
			  
			  
			  
				System.out.println(  "+++++++++"+row[0]  );
				System.out.println(  "---------"+row[1]  );
				System.out.println(  "---------"+row[2]  );
				System.out.println(  "---------"+row[3]  );
				System.out.println(  "---------"+row[4]  );
				System.out.println(  "---------"+row[5]  );
				System.out.println(  "---------"+row[6]  );
				System.out.println(  "---------"+row[7]  );
				System.out.println(  "---------"+row[8]  );
				System.out.println(  "+++++++++"+row[9]  );
				
				 
			}
		 
		
		     return "tally";
	         }

	
	
}
