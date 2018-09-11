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
import com.DieboldNixdorf.ProCompta.model.Branch;
import com.DieboldNixdorf.ProCompta.service.BranchService;
 

@Controller 
@RequestMapping("branch")
public class BranchController {
	
	
	
	@Autowired
	BranchService branchService;
	
	 
	@Autowired
	MessageSource messageSource;

	
 
	@RequestMapping("/list")
	public String listBranch(ModelMap model) {

	 
		List<Branch> Branchs = branchService.getAllBranchs();
		 model.addAttribute("Branchs", Branchs);
		 Branch branch = new Branch();
		 model.addAttribute("branch" ,branch );
		 
		return "branch";
	}

	
	@PostMapping("/list")
	public String saveBranch(ModelMap model , @ModelAttribute("branch") Branch branch) 
	{
		branchService.saveBranch(branch);
		return "redirect:/branch/list";
    }  
	
	
	@GetMapping("/edit-branch-{idBranch}") 
	public String editBranch(@PathVariable int idBranch, ModelMap model) 
	{
		
		List<Branch> branchs = branchService.getAllBranchs();
		model.addAttribute("branchs", branchs);
		Branch branch = branchService.findById(idBranch);
		model.addAttribute("branch", branch);
		model.addAttribute("edit", true);
		model.addAttribute("editBranch", "editBranch");
		 
		
		return "branch";
	}
	
	
	
	@PostMapping("/edit-branch-{idBranch}")
	public String editBranchforSavig (ModelMap model , @ModelAttribute("branch") Branch branch ) {
		
		branchService.saveBranch(branch);
		return "redirect:/branch/list";
	}
	
	@GetMapping("/delete-branch-{idBranch}")
	public String DeleteBranch(@PathVariable int idBranch) 
	{
		branchService.deleteBranchById(idBranch);
		return "redirect:/branch/list";
    }  
	
	

}
