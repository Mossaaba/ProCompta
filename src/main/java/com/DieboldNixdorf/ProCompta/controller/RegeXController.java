package com.DieboldNixdorf.ProCompta.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.DieboldNixdorf.ProCompta.model.RegeX;
import com.DieboldNixdorf.ProCompta.service.RegeXService;

@Controller
@RequestMapping("regeX")
public class RegeXController {

	@Autowired
	RegeXService regeXService;

	@Autowired
	MessageSource messageSource;

	@RequestMapping("/list")
	public String listRegeX(ModelMap model) {

		List<RegeX> listregeX = regeXService.getAllRegeX();
		model.addAttribute("listregeX", listregeX);
		RegeX regeX = new RegeX();
		model.addAttribute("regeX", regeX);
		return "regeX";
	}

	@PostMapping("/list")
	public String saveRegeX(ModelMap model, @ModelAttribute("regeX") RegeX regeX , final RedirectAttributes redirectAttrs) 
	{
		regeXService.saveRegeX(regeX);
		redirectAttrs.addFlashAttribute("msgTraitment" ,"Adding a new RegeX : " );
		redirectAttrs.addFlashAttribute("theRegeX" ,regeX.getNameRegex() );
		redirectAttrs.addFlashAttribute("style" ,"success" );
		return "redirect:/regeX/list";
	}

	@GetMapping("/edit-regeX-{idregex}")
	public String editRegeX(@PathVariable int idregex, ModelMap model) {
		List<RegeX> listRegeXs = regeXService.getAllRegeX();
		model.addAttribute("listRegeXs", listRegeXs);
		RegeX regeX = regeXService.findById(idregex);
		model.addAttribute("regeX", regeX);
		model.addAttribute("edit", true);
		model.addAttribute("editRegeX", "editRegeX");
		return "regeX";
	}

	@PostMapping("/edit-regeX-{idregex}")
	public String editRegeXforSavig(ModelMap model, @ModelAttribute("regeX") RegeX regeX , final RedirectAttributes redirectAttrs) {
		
		redirectAttrs.addFlashAttribute("msgTraitment" ,"Uppdating the RegeX : " );
		redirectAttrs.addFlashAttribute("theRegeX" ,regeX.getNameRegex());
		redirectAttrs.addFlashAttribute("style" ,"success" );
		regeXService.saveRegeX(regeX);
		return "redirect:/regeX/list";
	}

	@GetMapping("/delete-regeX-{idregex}")
	public String DeleteHost(@PathVariable int idregex ,final RedirectAttributes redirectAttrs ) {
		RegeX regeX = regeXService.findById(idregex);
		redirectAttrs.addFlashAttribute("msgTraitment" ,"deleting the Host : " );
		redirectAttrs.addFlashAttribute("theRegeX" ,regeX.getNameRegex() );
		redirectAttrs.addFlashAttribute("style" ,"danger" );
		regeXService.deleteRegeXById(idregex);
		return "redirect:/regeX/list";
	}

}
