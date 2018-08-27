package com.DieboldNixdorf.ProCompta.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.DieboldNixdorf.ProCompta.model.Transaction;
import com.DieboldNixdorf.ProCompta.service.TransactionService;

 
 

 

//http://docs.spring.io/spring/docs/current/spring-framework-reference/html/validation.html#validation-mvc-configuring
@Component
public class TransactionFormValidator implements Validator {

	 
	
	@Autowired
	TransactionService transactionService;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return Transaction.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "dateTransaction", "NotEmpty.transactioForm.dateTransaction");
		  
		/*
		  
		 Transaction transaction = (Transaction) target;
		if(nauthorisation.getNumber()==null || nauthorisation.getNumber()<=0){
			errors.rejectValue("number", "NotEmpty.userForm.number");
		 }
	    */
		 

	}

}