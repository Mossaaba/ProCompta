package com.DieboldNixdorf.ProCompta.controller;

import java.io.FileOutputStream;
import java.io.IOException;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.DieboldNixdorf.ProCompta.model.Bank;
import com.DieboldNixdorf.ProCompta.service.BankService;
import com.DieboldNixdorf.ProCompta.service.UserService;
import com.DieboldNixdorf.ProCompta.validator.UserFormValidator;

@Controller
@RequestMapping("bank")
public class BankController {

	@Autowired
	BankService bankService;

	@Autowired
	MessageSource messageSource;

	@Autowired
	UserFormValidator userFormValidator;

	@Autowired
	UserService userService;

	@RequestMapping("/list")
	public String listBank(ModelMap model) {
		List<Bank> banks = bankService.getAllBanks();
		model.addAttribute("banks", banks);
		Bank bank = new Bank();
		model.addAttribute("bank", bank);
		return "bank";
	}

	@PostMapping("/list")
	public String saveBank(ModelMap model, @ModelAttribute("bank") Bank bank, final RedirectAttributes redirectAttrs,
			BindingResult result) {
		if (!bankService.isbankUnique(bank.getAbbreviation())) {
			FieldError ssoError = new FieldError("bank", "abbreviation", messageSource.getMessage("non.unique.bank",
					new String[] { bank.getAbbreviation() }, Locale.getDefault()));
			result.addError(ssoError);
			model.addAttribute("style", "danger");
			model.addAttribute("msgTraitment", "Banque " + bank.getAbbreviation() + " Existe Deja");
			redirectAttrs.addFlashAttribute("style", "danger");
			return "bank";
		}

		redirectAttrs.addFlashAttribute("msgTraitment", "ADD A NEW BANK : ");
		redirectAttrs.addFlashAttribute("theBank", bank.getAbbreviation());
		redirectAttrs.addFlashAttribute("style", "success");
		redirectAttrs.addFlashAttribute("logo", bank.getLogo());
		bankService.saveBank(bank);
		return "redirect:/bank/list";
	}

	@GetMapping("/edit-bank-{idBank}")
	public String editBank(@PathVariable int idBank, ModelMap model) {
		Bank bank = bankService.findById(idBank);
		List<Bank> banks = bankService.getAllBanks();
		model.addAttribute("banks", banks);
		model.addAttribute("bank", bank);
		model.addAttribute("edit", true);
		model.addAttribute("msgTraitment",
				"please entre the information for  Updating bank :  " + bank.getAbbreviation());
		model.addAttribute("logo", bank.getLogo());
		model.addAttribute("style", "warning");
		return "bank";
	}

	@PostMapping("/edit-bank-{idBank}")
	public String editBankforSavig(ModelMap model, @ModelAttribute("bank") Bank bank,
			final RedirectAttributes redirectAttrs) {

		bankService.saveBank(bank);

		redirectAttrs.addFlashAttribute("msgTraitment", "Update the BANK : ");
		redirectAttrs.addFlashAttribute("theBank", bank.getAbbreviation());
		redirectAttrs.addFlashAttribute("style", "success");
		redirectAttrs.addFlashAttribute("logo", bank.getLogo());
		return "redirect:/bank/list";
	}

	@GetMapping("/delete-bank-{idBank}")
	public String DeleteBank(@PathVariable int idBank, final RedirectAttributes redirectAttrs) {
		Bank bank = bankService.findById(idBank);
		redirectAttrs.addFlashAttribute("msgTraitment", "Deleting the bank the BANK : ");
		redirectAttrs.addFlashAttribute("theBank", bank.getAbbreviation());
		redirectAttrs.addFlashAttribute("style", "danger");
		redirectAttrs.addFlashAttribute("logo", bank.getLogo());
		bankService.deleteBankById(idBank);
		return "redirect:/bank/list";
	}

	@RequestMapping(value = "/imageUpload", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> fileUpload(MultipartHttpServletRequest request,
			HttpServletResponse response) {

		Map<String, Object> map = new HashMap<String, Object>();
		List<String> fileUploadedList = new ArrayList<String>();
		Iterator<String> itr = request.getFileNames();
		MultipartFile mpf = null;
		while (itr.hasNext()) {
			mpf = request.getFile(itr.next());
			try {
				String path = request.getSession().getServletContext().getRealPath("/resources/pages/img/banks");
				FileCopyUtils.copy(mpf.getBytes(),
						new FileOutputStream(path + "/" + mpf.getOriginalFilename().replace(" ", "-")));
				fileUploadedList.add(mpf.getOriginalFilename().replace(" ", "-"));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		map.put("Status", 200);
		map.put("SucessfulList", fileUploadedList);
		return map;
	}
}
