package com.DieboldNixdorf.ProCompta.service;

import java.util.List;

import com.DieboldNixdorf.ProCompta.model.Transaction;

public interface TransactionService {

	Transaction findById(Integer id);
	List<Transaction> findAllTransaction();
	List<String> listErreursTransaction();
	List<String> listinfosTransaction();
	void saveTrasanction(Transaction transaction);
	void deleteTransaction(Transaction transaction);

	 

}