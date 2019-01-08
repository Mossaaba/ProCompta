package com.DieboldNixdorf.ProCompta.controller;

 
import java.text.ParseException;
 
 
 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class HostFileController {
	
	 

	@RequestMapping(value = "/hostFile" ,method = RequestMethod.GET)
    public String GoHostFile(Model model  , final RedirectAttributes redirectAttributes) 
	{
 
		model.addAttribute("css" , "complete");
		 
				
        return "hostFile";
    }
	
	
	@RequestMapping(value = "/hostFile/find", method = RequestMethod.POST)
	public String getListTransactionHost( 
			BindingResult result, Model model, RedirectAttributes redirectAttributes) throws ParseException 
	{

       
          
 
	    return "hostFile";
    }
	
	
	@RequestMapping(value = "/tally" ,method = RequestMethod.GET)
    public String GoPointage(Model model  , final RedirectAttributes redirectAttributes) 
	{
 
		model.addAttribute("css" , "complete");
		 
				
        return "tally";
    }
	
	
	@RequestMapping(value = "/tally/find", method = RequestMethod.POST)
	public String getTransactionPointage( 
			BindingResult result, Model model, RedirectAttributes redirectAttributes) throws ParseException 
	{

       
          
 
	    return "tally";
    }

}
