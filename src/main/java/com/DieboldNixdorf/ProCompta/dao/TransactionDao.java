package com.DieboldNixdorf.ProCompta.dao;

 
 
import java.util.List;

 
import com.DieboldNixdorf.ProCompta.model.Transaction;
public interface TransactionDao {
	
	
	Transaction findById(Integer id);
	List<Transaction> findAllTransaction();
	List<String> listErreursTransaction();
	List<String> listinfosTransaction();
	void saveTrasanction(Transaction transaction);
	void deleteTransaction(Transaction transaction);
	 
	

}
