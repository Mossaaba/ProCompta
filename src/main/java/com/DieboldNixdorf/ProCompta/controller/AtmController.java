package com.DieboldNixdorf.ProCompta.controller;

 
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.DieboldNixdorf.ProCompta.model.Atm;
import com.DieboldNixdorf.ProCompta.model.Branch;
import com.DieboldNixdorf.ProCompta.model.Host;
import com.DieboldNixdorf.ProCompta.service.AtmService;
import com.DieboldNixdorf.ProCompta.service.BranchService;
import com.DieboldNixdorf.ProCompta.service.HostService;

@Controller
@RequestMapping("Atm")
public class AtmController {
	

	@Autowired 
	AtmService atmService;
	
	@Autowired
	BranchService branchService;
	 
	@Autowired
	HostService hostService;
	
	@Autowired
	MessageSource messageSource;
	
	
	@GetMapping("/list")
	public String listAtm(Model theModel)
	{
		populateDefaultModel(theModel);
		List<Atm> listAtms = atmService.listAtms();
		theModel.addAttribute("listAtms",listAtms);
		Atm atm = new Atm();
		theModel.addAttribute("atm", atm);
		return "atm";
	}
	
	@PostMapping("/list")
	public String saveAtm(ModelMap model , @ModelAttribute("atm") Atm atm) 
	{
		  Host hostHandler = atm.getHost() ;
		  Branch branchHandler = atm.getBranch();
		  atmService.saveAtm(atm, hostHandler.getIdHost(), branchHandler.getIdBranch());
		  
		return "redirect:/Atm/list";
    }  
	
	
	
	@GetMapping("/edit-atm-{idAtm}") 
	public String editAtm(@PathVariable int idAtm, Model model) 
	{
		
		 
		List<Atm> listAtms = atmService.listAtms();
		
		populateDefaultModel(model);
		
		model.addAttribute("listAtms", listAtms);
		Atm atm = atmService.findById(idAtm);
		model.addAttribute("atm", atm);
		model.addAttribute("edit", true);
		model.addAttribute("editAtm", "editAtm");
		 
		
		return "atm";
	}
	
	
	@PostMapping("/edit-atm-{idAtm}")
	public String editAtmforSavig (ModelMap model , @ModelAttribute("atm") Atm atm ) {
		
		   Host hostHandler = atm.getHost() ;
		   Branch branchHandler = atm.getBranch();
		   atmService.saveAtm(atm, hostHandler.getIdHost(), branchHandler.getIdBranch());
	
		return "redirect:/Atm/list";
	}
	
	
	@GetMapping("/delete-atm-{idAtm}")
	public String DeleteAtm(@PathVariable int idAtm) 
	{
          atmService.deleteById(idAtm);

		return "redirect:/Atm/list";
    }  
	

	
	private void populateDefaultModel(Model model)
	{

		List<String> ListVendors = new LinkedList<>(Arrays.asList(new String[] 
				                {"" , "NCR", "DIEBOLD" ,"WINCOR"}));
		model.addAttribute("ListVendors", ListVendors);

        List<Branch> branches = branchService.getAllBranchs();
		model.addAttribute("branches", branches);
	 
		List<Host> hosts = hostService.findAllHosts();
		model.addAttribute("hosts", hosts);
		 
		
		
	}

}
