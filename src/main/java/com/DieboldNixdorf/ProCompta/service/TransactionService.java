package com.DieboldNixdorf.ProCompta.service;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

import com.DieboldNixdorf.ProCompta.model.Transaction;

 
 
 

 

public interface TransactionService {
	
	Transaction findById(Integer id);
	List<Transaction> findAll();
	List<String> listCardState();
	List<String> listCashState();
	List<String> listErreurs();
	List<Transaction> listTransactionByFilter (Date DebuttransactionDate , Date fintransactionDate ,
			Time startingTimeTransaction,  Time fnisgingTimeTransaction , 
			String cardNumber ,  String CradState , long montant  , String etatcash , 
			String numberAuthorisatin  , String errorTransaction , 
			long MinAmount  , long MaxAmount ) ;
	
	 
	
}