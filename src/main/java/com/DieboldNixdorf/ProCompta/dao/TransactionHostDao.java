package com.DieboldNixdorf.ProCompta.dao;

import java.util.List;

 
import com.DieboldNixdorf.ProCompta.model.TransactionHost;

public interface TransactionHostDao {
	
	
	TransactionHost findById(Integer idTransactionHost);
	List<TransactionHost> findAllTransaction();
	int saveTransaction(TransactionHost transactionHost);
	void updateTransactionHost(TransactionHost transactionHost);
	void deleteTransaction(Integer idTransactionHost);
	List<TransactionHost> listTransactionAfterFiltring(TransactionHost trx);
	

}
