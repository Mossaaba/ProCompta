package com.DieboldNixdorf.ProCompta.controller;

import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.DieboldNixdorf.ProCompta.model.Atm;
import com.DieboldNixdorf.ProCompta.model.Branch;
 
import com.DieboldNixdorf.ProCompta.service.AtmService;
import com.DieboldNixdorf.ProCompta.service.BranchService;
 
import com.DieboldNixdorf.ProCompta.validator.AtmFormValidator;

@Controller
@RequestMapping("Atm")
public class AtmController {

	@Autowired
	AtmService atmService;

	@Autowired
	BranchService branchService;

	@Autowired
	MessageSource messageSource;

	@Autowired
	AtmFormValidator atmFormValidator;

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		binder.setValidator(atmFormValidator);
	}

	@GetMapping("/list")
	public String listAtm(Model theModel) {
		populateDefaultModel(theModel);
		
		
		List<Atm> listAtms = atmService.listAtms();
		theModel.addAttribute("listAtms", listAtms);
		
		
		
		Atm atm = new Atm();
		theModel.addAttribute("atm", atm);
		return "atm";
	}

	@PostMapping("/list")
	public String saveAtm(ModelMap model, @ModelAttribute("atm") Atm atm, final RedirectAttributes redirectAttrs,
			BindingResult result) {

		if (result.hasErrors()) {

			return "atm";
		}

		else {
			 
			Branch branchHandler = atm.getBranch();
			atmService.saveAtm(atm,  branchHandler.getIdBranch());

			redirectAttrs.addFlashAttribute("msgTraitment", "ADD A NEW ATM : ");
			redirectAttrs.addFlashAttribute("theATM", atm.getNameAtm());
			redirectAttrs.addFlashAttribute("style", "success");

			return "redirect:/Atm/list";
		}

	}

	@GetMapping("/edit-atm-{idAtm}")
	public String editAtm(@PathVariable int idAtm, Model model) {

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
	public String editAtmforSavig(ModelMap model, @ModelAttribute("atm") Atm atm) {

		 
		Branch branchHandler = atm.getBranch();
		atmService.saveAtm(atm,   branchHandler.getIdBranch());

		return "redirect:/Atm/list";
	}

	@GetMapping("/delete-atm-{idAtm}")
	public String DeleteAtm(@PathVariable int idAtm, final RedirectAttributes redirectAttrs) {

		Atm atm = atmService.findById(idAtm);

		redirectAttrs.addFlashAttribute("msgTraitment", "Deleting the ATM  : ");
		redirectAttrs.addFlashAttribute("theATM", atm.getNameAtm());
		redirectAttrs.addFlashAttribute("style", "danger");

		atmService.deleteById(idAtm);

		return "redirect:/Atm/list";
	}

	private void populateDefaultModel(Model model) {

		List<String> ListVendors = new LinkedList<>(Arrays.asList(new String[] {"NCR","DIEBOLD-NIXDORF"}));
		model.addAttribute("ListVendors", ListVendors);

		List<Branch> branches = branchService.getAllBranchs();
		model.addAttribute("branches", branches);
		 

	}

}
