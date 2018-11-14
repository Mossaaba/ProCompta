package com.DieboldNixdorf.ProCompta.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.DieboldNixdorf.ProCompta.model.Atm;

import com.DieboldNixdorf.ProCompta.service.AtmService;

@Component
public class AtmFormValidator implements Validator {

	@Autowired
	AtmService atmService;

	@Override
	public boolean supports(Class<?> clazz) {
		return Atm.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "branch", "NotEmpty.atmFormValidator.branch");

	}

}