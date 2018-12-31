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
import com.DieboldNixdorf.ProCompta.model.Incident;
import com.DieboldNixdorf.ProCompta.service.IncidentService;
 
 

 


@Controller
public class IncidentController {
	
	 
	
	@Autowired
	IncidentService iService;
	
	
	
	@RequestMapping(value = "/incident" ,method = RequestMethod.GET)
    public String GoIncident(Model model , @ModelAttribute Incident incident , final RedirectAttributes redirectAttributes) 
	{
 
		model.addAttribute("css" , "complete");
		populateDefaultModel(model);
		model.addAttribute("incident" , new Incident());
				
        return "incident";
    }
	
	
	@RequestMapping(value = "/incident/find", method = RequestMethod.POST)
	public String getListIncidentByfilter(@ModelAttribute("incident") @Validated Incident incident,
			BindingResult result, Model model, RedirectAttributes redirectAttributes) throws ParseException 
			{
		
		       
		         System.out.println("ATM            :   "+incident.getIdAtm());
		         System.out.println("DETAILS        :   "+incident.getDetailsincidents());
		         System.out.println("STARTING DATE  :   "+incident.getStartingDateFilterIncident());
		         System.out.println("FINISHING DATE :   "+incident.getFinishingDateFilterIncident());
		         System.out.println("STARTING TIME  :   "+incident.getStartingTimeFilterIncident());
		         System.out.println("FINISHING TIME :   "+incident.getFinisingTimeFilterIncident());
		      
		
		           model.addAttribute("Filter","FilterResultat");
		           model.addAttribute("incidentFilter",incident);
		         
		           List<Incident> listIncidentAfterFilter  = iService.listincidentsAfterFiltring(incident);
		           model.addAttribute("listIncidentAfterFilter",listIncidentAfterFilter);
		 
			    return "incident";
		    }

	 
	
		
	
	private void populateDefaultModel(Model model)
	{
		List<Atm> listATM =  iService.find_All_ATM_DIEBOLD_NIXDORF();
		model.addAttribute("listATM", listATM);
		
		List<Incident> listIncident = iService.typeOfIncident();
        model.addAttribute("listIncident",listIncident);
		 
	}
	
}
