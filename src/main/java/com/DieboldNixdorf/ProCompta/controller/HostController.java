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

import com.DieboldNixdorf.ProCompta.model.Host;
import com.DieboldNixdorf.ProCompta.service.HostService;

@Controller
@RequestMapping("host")
public class HostController {

	@Autowired
	HostService hostService;

	@Autowired
	MessageSource messageSource;

	@RequestMapping("/list")
	public String listHost(ModelMap model) {

		List<Host> hosts = hostService.findAllHosts();
		model.addAttribute("hosts", hosts);
		Host host = new Host();
		model.addAttribute("host", host);

		return "host";
	}

	@PostMapping("/list")
	public String saveHost(ModelMap model, @ModelAttribute("host") Host host , final RedirectAttributes redirectAttrs) {
		hostService.saveHost(host);
		
		redirectAttrs.addFlashAttribute("msgTraitment" ,"Adding a new Host : " );
		redirectAttrs.addFlashAttribute("theHost" ,host.getNomHost() );
		redirectAttrs.addFlashAttribute("style" ,"success" );
		
		
		
		return "redirect:/host/list";
	}

	@GetMapping("/edit-host-{idHost}")
	public String editHost(@PathVariable int idHost, ModelMap model) {

		List<Host> hosts = hostService.findAllHosts();
		model.addAttribute("hosts", hosts);
		Host host = hostService.findHostById(idHost);
		model.addAttribute("host", host);
		model.addAttribute("edit", true);
		
		model.addAttribute("editHost", "editHost");
		return "host";
	}

	@PostMapping("/edit-host-{idHost}")
	public String editHostforSavig(ModelMap model, @ModelAttribute("host") Host host , final RedirectAttributes redirectAttrs) {
		
		redirectAttrs.addFlashAttribute("msgTraitment" ,"Uppdating the Host : " );
		redirectAttrs.addFlashAttribute("theHost" ,host.getNomHost() );
		redirectAttrs.addFlashAttribute("style" ,"success" );
		
		hostService.saveHost(host);
		return "redirect:/host/list";
	}

	@GetMapping("/delete-host-{idHost}")
	public String DeleteHost(@PathVariable int idHost ,final RedirectAttributes redirectAttrs ) {
		
		Host host = hostService.findHostById(idHost);
		
		redirectAttrs.addFlashAttribute("msgTraitment" ,"Uppdating the Host : " );
		redirectAttrs.addFlashAttribute("theHost" ,host.getNomHost() );
		redirectAttrs.addFlashAttribute("style" ,"danger" );
				
				
		hostService.deleteHostById(idHost);
		
		
		return "redirect:/host/list";
	}

}
