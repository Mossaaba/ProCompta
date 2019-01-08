package com.DieboldNixdorf.ProCompta.service;

import java.util.List;

import com.DieboldNixdorf.ProCompta.model.Transaction;
import com.DieboldNixdorf.ProCompta.model.TransactionHost;

public interface TransactionService {

	Transaction findById(Integer id);
	List<Transaction> findAllTransaction();
	List<String> listErreursTransaction();
	List<String> listinfosTransaction();
	void saveTrasanction(Transaction transaction);
	void updateTransaction(Transaction transaction);
	void deleteTransaction(Transaction transaction);
	List<String> listATM();
	List<Transaction> listTransactionAfterFiltring(Transaction trx);

	 

}