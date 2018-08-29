package com.DieboldNixdorf.ProCompta.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.DieboldNixdorf.ProCompta.model.Incident;
import com.DieboldNixdorf.ProCompta.service.IncidentService;
 

 
 

 

//http://docs.spring.io/spring/docs/current/spring-framework-reference/html/validation.html#validation-mvc-configuring
@Component
public class IncidentFormValidator implements Validator {

	 
	
	@Autowired
	IncidentService incidentService;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return Incident.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "DateIncident", "NotEmpty.transactioForm.DateIncident");
		  
		/*
		  
		 Transaction transaction = (Transaction) target;
		if(nauthorisation.getNumber()==null || nauthorisation.getNumber()<=0){
			errors.rejectValue("number", "NotEmpty.userForm.number");
		 }
	    */
		 

	}

}