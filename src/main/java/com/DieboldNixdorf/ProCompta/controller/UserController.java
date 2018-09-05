package com.DieboldNixdorf.ProCompta.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

 
import com.DieboldNixdorf.ProCompta.model.User;
 
import com.DieboldNixdorf.ProCompta.service.UserService;
 

@Controller
@RequestMapping("user")
public class UserController {
	

	@Autowired
	private UserService userService;
	
 
	
	@RequestMapping("/list")
	public String listUsers(Model theModel) {
		
		populateDefaultModel(theModel);
		return "Users";
	}
	
	@PostMapping("/addUser")
	public String addUser(@ModelAttribute("user") User theUser , final RedirectAttributes redirectAttrs)
	{
		userService.addUser(theUser);
		redirectAttrs.addFlashAttribute("msgTraitment" ,"Add USER : " );
		redirectAttrs.addFlashAttribute("theUser" ,theUser );
		redirectAttrs.addFlashAttribute("style" ,"info" );
		return "redirect:/user/list";
	}
	
	@GetMapping("/updateUser")
	public String updateUser(@RequestParam("userName") String theName , Model theModel )
	{ 
		populateDefaultModel(theModel);
		User userUpdate =  userService.getUserByName(theName);
		theModel.addAttribute("userUpdate", userUpdate);
		theModel.addAttribute("msg", "update");
		return "Users";
	}
	
	@PostMapping("/saveUser")
	public String saveUser(@ModelAttribute("userUpdate") User theUser ,   final RedirectAttributes redirectAttrs )
	{
		userService.updateUser(theUser);
		redirectAttrs.addFlashAttribute("msgTraitment" ,"Update USER : " );
		redirectAttrs.addFlashAttribute("theUser" ,theUser );
		redirectAttrs.addFlashAttribute("style" ,"success" );
		return "redirect:/user/list";
	}
	
	
	@GetMapping("/deleteUser")
	public String deleteUser(@RequestParam("userName") String theName , Model theModel , final RedirectAttributes redirectAttrs)
	{ 
		User userUpdate =  userService.getUserByName(theName); 
		userService.removeUser(theName);
		redirectAttrs.addFlashAttribute("theUser" ,userUpdate );
		redirectAttrs.addFlashAttribute("msgTraitment" ,"Delete user : " );
		redirectAttrs.addFlashAttribute("style" ,"danger" );
		return "redirect:/user/list";
	}

	private void populateDefaultModel(Model model)
	{
		List<User> listeUsers = userService.listUsers();
 
		// add the customers to the model
		model.addAttribute("listeUsers", listeUsers);
		 
		User user = new User();
		model.addAttribute("user", user);	
		
		
	}
	
	
}
