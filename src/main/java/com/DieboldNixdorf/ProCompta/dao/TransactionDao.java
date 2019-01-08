package com.DieboldNixdorf.ProCompta.dao;

 
 
import java.util.List;

 
import com.DieboldNixdorf.ProCompta.model.Transaction;
public interface TransactionDao {
	
	
	Transaction findById(Integer id);
	List<Transaction> findAllTransaction();
	List<String> listinfosTransaction();
	void saveTrasanction(Transaction transaction);
	void deleteTransaction(Transaction transaction);
	void updateTransaction(Transaction transaction);
	List<String> listATM();
	List<String> listErreursTransaction();
	List<Transaction> listTransactionAfterFiltring(Transaction trx);
	
	
	 
	

}
