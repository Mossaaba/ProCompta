package com.DieboldNixdorf.ProCompta.dao;

 
import java.sql.Date;
import java.sql.Time;
import java.util.List;

import com.DieboldNixdorf.ProCompta.model.Transaction;
public interface TransactionDao {
	
	
	Transaction findById(Integer id);
	List<Transaction> findAll();
	List<String> listCardState();
	List<String> listCashState();
	List<String> listErreurs();
 
	 
	

}
