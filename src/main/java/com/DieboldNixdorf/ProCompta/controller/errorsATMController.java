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
import com.DieboldNixdorf.ProCompta.model.ErrorATM;
 
import com.DieboldNixdorf.ProCompta.service.ErrorATMService;
 

 


@Controller
public class errorsATMController {
	
 
	
	
	
	@Autowired
	ErrorATMService errService;
	
	
	
	@RequestMapping(value = "/errorsATM" ,method = RequestMethod.GET)
    public String GoErrorATM(Model model , @ModelAttribute ErrorATM errorATM , final RedirectAttributes redirectAttributes) 
	{
 
		model.addAttribute("css" , "complete");
		populateDefaultModel(model);
		model.addAttribute("errorATM" , new ErrorATM());
				
        return "errorsATM";
    }
	
	
	@RequestMapping(value = "/errorsATM/find", method = RequestMethod.POST)
	public String getListErrorsATMByfilter(@ModelAttribute("errorATM") @Validated ErrorATM errorATM,
			BindingResult result, Model model, RedirectAttributes redirectAttributes) throws ParseException 
			{
		
		       /*
		         System.out.println("ATM            :   "+incident.getIdAtm());
		         System.out.println("DETAILS        :   "+incident.getDetailsincidents());
		         System.out.println("STARTING DATE  :   "+incident.getStartingDateFilterIncident());
		         System.out.println("FINISHING DATE :   "+incident.getFinishingDateFilterIncident());
		         System.out.println("STARTING TIME  :   "+incident.getStartingTimeFilterIncident());
		         System.out.println("FINISHING TIME :   "+incident.getFinisingTimeFilterIncident());
		       */  
		
		           model.addAttribute("Filter","FilterResultat");
		           model.addAttribute("errorATM_Filter",errorATM);
		         
		           List<ErrorATM> listErrorsATMAfterFilter  = errService.listErrorsAfterFiltring(errorATM);
		           model.addAttribute("listErrorsATMAfterFilter",listErrorsATMAfterFilter);
		 
			    return "errorsATM";
		    }

	 
	
		
	
	private void populateDefaultModel(Model model)
	{
		List<Atm> listATM =  errService.find_All_ATM_DIEBOLD_NIXDORF();
		model.addAttribute("listATM", listATM);
		
		List<ErrorATM> listErrorATM = errService.typeOfErrorATM();
        model.addAttribute("listErrorATM",listErrorATM);
		 
	}

}
