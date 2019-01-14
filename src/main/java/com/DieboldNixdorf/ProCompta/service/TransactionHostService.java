package com.DieboldNixdorf.ProCompta.service;

import java.util.List;

 
import com.DieboldNixdorf.ProCompta.model.TransactionHost;

public interface TransactionHostService {
	
	
	
	TransactionHost findById(Integer idTransactionHost);
	List<TransactionHost> findAllTransaction();
	int saveTransaction(TransactionHost transactionHost);
	void updateTransactionHost(TransactionHost transactionHost);
	void deleteTransaction(Integer idTransactionHost);
	List<TransactionHost> listTransactionAfterFiltring(TransactionHost trx);

}
