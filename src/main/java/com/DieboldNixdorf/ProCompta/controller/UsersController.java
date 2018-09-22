package com.DieboldNixdorf.ProCompta.controller;

import java.util.List;
import java.util.Locale;

import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.AuthenticationTrustResolver;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.rememberme.PersistentTokenBasedRememberMeServices;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.DieboldNixdorf.ProCompta.model.User;
import com.DieboldNixdorf.ProCompta.model.UserProfile;
import com.DieboldNixdorf.ProCompta.service.UserProfileService;
import com.DieboldNixdorf.ProCompta.service.UserService;
import com.DieboldNixdorf.ProCompta.validator.UserFormValidator;

@Controller
@SessionAttributes("roles")
@RequestMapping("user")
public class UsersController {

	@Autowired
	UserService userService;

	@Autowired
	UserProfileService userProfileService;

	@Autowired
	UserDetailsService userDetailsService;

	@Autowired
	MessageSource messageSource;

	@Autowired
	PersistentTokenBasedRememberMeServices persistentTokenBasedRememberMeServices;

	@Autowired
	AuthenticationTrustResolver authenticationTrustResolver;

	@Autowired
	UserFormValidator userFormValidator;

	@RequestMapping("/list")
	public String listUsers(ModelMap model) {

		List<User> users = userService.findAllUsers();
	 
 
		
		User user = new User();

		model.addAttribute("users", users);
		model.addAttribute("user", user);
		model.addAttribute("loggedinuser", getPrincipal());
		model.addAttribute("edit", false);
		model.addAttribute("loggedinuser", getPrincipal());

		return "Users";
	}

	@RequestMapping(value = { "/list" }, method = RequestMethod.POST)
	public String saveUser(@Valid User user, BindingResult result, ModelMap model,
			final RedirectAttributes redirectAttrs) {

		if (result.hasErrors()) {

			model.addAttribute("msgTraitment", "Errore adding ");
			model.addAttribute("theUser", user.getSsoId());
			model.addAttribute("style", "danger");
			model.addAttribute("msg", "Error validation");
			return "Users";
		}

		if (!userService.isUserSSOUnique(user.getId(), user.getSsoId())) {
			FieldError ssoError = new FieldError("user", "ssoId", messageSource.getMessage("non.unique.ssoId",
					new String[] { user.getSsoId() }, Locale.getDefault()));
			result.addError(ssoError);

			model.addAttribute("style", "danger");
			model.addAttribute("msg", "User " + user.getSsoId() + " Existe Deja");

			return "Users";
		}

		userService.saveUser(user);
		model.addAttribute("success",
				"User " + user.getFirstName() + " " + user.getLastName() + " registered successfully");
		model.addAttribute("loggedinuser", getPrincipal());

		redirectAttrs.addFlashAttribute("msgTraitment", "Add USER : ");
		redirectAttrs.addFlashAttribute("theUser", user.getSsoId());
		redirectAttrs.addFlashAttribute("style", "success");

		return "redirect:/user/list";
	}

	@RequestMapping(value = { "/edit-user-{ssoId}" }, method = RequestMethod.GET)
	public String editUser(@PathVariable String ssoId, ModelMap model) {

		List<User> users = userService.findAllUsers();
		User user = userService.findBySSO(ssoId);

		model.addAttribute("users", users);
		model.addAttribute("user", user);
		model.addAttribute("loginID", user.getSsoId());
		model.addAttribute("edit", true);
		model.addAttribute("editUser", "editUser");
		model.addAttribute("loggedinuser", getPrincipal());

		return "Users";
	}

	@RequestMapping(value = { "/edit-user-{ssoId}" }, method = RequestMethod.POST)
	public String updateUser(@Valid User user, BindingResult result, ModelMap model, @PathVariable String ssoId,
			final RedirectAttributes redirectAttrs) {

		if (result.hasErrors()) {

			model.addAttribute("msgTraitment", "Errore Update User  ");
			model.addAttribute("theUser", user);
			model.addAttribute("style", "danger");

			return "Users";
		}

		userService.updateUser(user);

		model.addAttribute("success",
				"User " + user.getFirstName() + " " + user.getLastName() + " updated successfully");
		redirectAttrs.addFlashAttribute("msgTraitment", "Update User successfully ");
		redirectAttrs.addFlashAttribute("theUser", "" + user.getFirstName() + " " + user.getLastName() + "");
		redirectAttrs.addFlashAttribute("style", "success");
		model.addAttribute("loggedinuser", getPrincipal());

		return "redirect:/user/list";
	}

	 
	@RequestMapping(value = { "/delete-user-{ssoId}" }, method = RequestMethod.GET)
	public String deleteUser(@PathVariable String ssoId) {
		userService.deleteUserBySSO(ssoId);
		return "redirect:/user/list";
	}

	 
	@ModelAttribute("roles")
	public List<UserProfile> initializeProfiles() {
	 
		return userProfileService.findAll();
	}

	 
	private String getPrincipal() {
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails) principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}

}