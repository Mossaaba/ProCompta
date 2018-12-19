package com.DieboldNixdorf.ProCompta.controller;

 
import java.text.ParseException;
 
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

import com.DieboldNixdorf.ProCompta.model.Incident;
import com.DieboldNixdorf.ProCompta.service.IncidentService;

import com.DieboldNixdorf.ProCompta.validator.IncidentFormValidator;
 

 


@Controller
public class IncidentController {
	
	@Autowired
	IncidentFormValidator incidentFormValidator;
 
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(incidentFormValidator);
	}
	
	
	@SuppressWarnings("unused")
	private IncidentService incidentService;

	@Autowired
	public void setTransactionService(IncidentService theincidentService) {
		this.incidentService = theincidentService;
	}
	
	
	
	
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
		
		
		
		if (result.hasErrors())
		 {
				populateDefaultModel(model);
				model.addAttribute("msg", "Vérfier les donées saisies SVP");
				model.addAttribute("css" , "danger");
			
			return "incident";
		} 
		else 
		{
			    populateDefaultModel(model);
				model.addAttribute("msg", "Totalité des Incident");
				model.addAttribute("css" , "success");	
		}
			    return "incident";
		}

	 
	
		
	
	private void populateDefaultModel(Model model)
	{

		
		
		List<String> TypeIncident = new LinkedList<>(Arrays.asList(new String[] {" "}));
		
		 
		model.addAttribute("TypeIncident", TypeIncident);

		 
		 
	}
}
