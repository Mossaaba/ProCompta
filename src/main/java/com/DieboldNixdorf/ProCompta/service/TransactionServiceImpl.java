package com.DieboldNixdorf.ProCompta.service;

import java.sql.Date;
import java.sql.Time;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.DieboldNixdorf.ProCompta.dao.TransactionDao;
import com.DieboldNixdorf.ProCompta.model.Transaction;
 
 
 

 

@Service("transctionService")
public class TransactionServiceImpl implements TransactionService {
	
	
	TransactionDao transactionDao;
	
	@Autowired
	public void setTransactionDao(TransactionDao transactionDao) {
		this.transactionDao = transactionDao;
	}

	@Override
	public Transaction findById(Integer id) {
	return transactionDao.findById(id);
	}

	@Override
	public List<Transaction> findAll() {
		return transactionDao.findAll();
	}


	@Override
	public List<String> listCardState() {
		return transactionDao.listCardState();
	}


	@Override
	public List<String> listCashState() {
		return transactionDao.listCashState();
	}


	@Override
	public List<String> listErreurs() {
		return transactionDao.listErreurs();
	}


	@Override
	public List<Transaction> listTransactionByFilter(Date DebuttransactionDate , Date fintransactionDate ,
			Time startingTimeTransaction,  Time fnisgingTimeTransaction , 
			String cardNumber ,  String CradState  , long montant  , String etatcash , 
			String numberAuthorisatin  , String errorTransaction , 
			long MinAmount  , long MaxAmount ) {

		return transactionDao.listTransactionByFilter(DebuttransactionDate, fintransactionDate ,
				startingTimeTransaction, fnisgingTimeTransaction , 
				cardNumber ,   CradState , montant , etatcash  ,numberAuthorisatin  ,errorTransaction , 
				 MinAmount  ,  MaxAmount );
	}

	
 

	 
}