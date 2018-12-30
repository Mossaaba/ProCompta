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
import com.DieboldNixdorf.ProCompta.model.Atm;
import com.DieboldNixdorf.ProCompta.model.Replenishment;
import com.DieboldNixdorf.ProCompta.service.ReplenishmentService;

@Controller
public class CashBalance {
	
	
	@Autowired 
	ReplenishmentService replshService;
	
	@RequestMapping(value = "/cashBalance" ,method = RequestMethod.GET)
    public String GoErrorATM(Model model , @ModelAttribute Replenishment replenishment , final RedirectAttributes redirectAttributes) 
	{
      
		model.addAttribute("css" , "complete");
		populateDefaultModel(model);
		model.addAttribute("replenishment" , new Replenishment());
				
        return "cashBalance";
    }
	
	@RequestMapping(value = "/cashBalance/find", method = RequestMethod.POST)
	public String getListReplenishmentByfilter(@ModelAttribute("replenishment") @Validated Replenishment replenishment,
			BindingResult result, Model model, RedirectAttributes redirectAttributes) throws ParseException 
			{
		
		     
		         System.out.println("ATM            :   "+replenishment.getIdAtm());
		 
		         System.out.println("STARTING DATE  :   "+replenishment.getStartingDateFilterReplenishment());
		         System.out.println("FINISHING DATE :   "+replenishment.getFinishingDateFilterReplenishment());
		         System.out.println("STARTING TIME  :   "+replenishment.getStartingTimeFilterReplenishment());
		         System.out.println("FINISHING TIME :   "+replenishment.getFinisingTimeFilterReplenishment());
		       
		
		           model.addAttribute("Filter","FilterResultat");
		           model.addAttribute("replenishment",replenishment);
		         
		           List<Replenishment> listReplenishmentAfterFilter  = replshService.listReplenishmentAfterFiltring(replenishment);
		           model.addAttribute("listReplenishmentAfterFilter",listReplenishmentAfterFilter);
		 
			    return "cashBalance";
		    }
	

	
	private void populateDefaultModel(Model model)
	{
		List<Atm> listATM =  replshService.find_All_ATM_DIEBOLD_NIXDORF();
		model.addAttribute("listATM", listATM);
		
		 
		 
	}
}
