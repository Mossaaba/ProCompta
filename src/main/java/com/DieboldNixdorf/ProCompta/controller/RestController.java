package com.DieboldNixdorf.ProCompta.controller;

 
 
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.jboss.logging.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.DieboldNixdorf.ProCompta.model.Atm;
import com.DieboldNixdorf.ProCompta.model.Branch;
import com.DieboldNixdorf.ProCompta.service.AtmService;
import com.DieboldNixdorf.ProCompta.service.BranchService;


@org.springframework.web.bind.annotation.RestController
@RequestMapping("/api")
public class RestController {
	@Autowired 
	private BranchService branchService;
	
	@Autowired 
	private AtmService atmService;
	
	
	
	@GetMapping("/disque")
	 public List<String> listDisque() {
	 
		List<String> listDisque = Stream.of("C:", "D:", "E:").collect(Collectors.toList());
		return listDisque;
	}
	
	
	 
	@GetMapping("/Branches")
	 public List<Branch> listBranches() {
	 
		List<Branch> ListBranches =branchService.getAllBranchs() ;
		return ListBranches;
	} 
	
	
	 @GetMapping("/atms-{idBranch}")
	 public List<Atm> listAtms(@PathVariable("idBranch") int idBranch) {
	 
		List<Atm> ListAtms =atmService.listAtmsByBranch(idBranch);
		return ListAtms;
	} 
	
	 
	 
	 @GetMapping("/atm-{brancheId}")
	 public @ResponseBody  List<Atm> getAllAtms(@PathVariable("brancheId") int brancheId) {
		 List<Atm> ListAtms =atmService.listAtmsByBranch(brancheId);
			return ListAtms;
	 }
	 
	 
	
	
	
	
	
	
	
	
}
