package com.DieboldNixdorf.ProCompta.dao;

import java.util.List;

import com.DieboldNixdorf.ProCompta.model.Reconciliation;
import com.DieboldNixdorf.ProCompta.model.Transaction;
import com.DieboldNixdorf.ProCompta.model.TransactionHost;

 

public interface ReconciliationDao {
	Reconciliation findReconciliationById(Integer idReconciliation);
	List<Reconciliation> findAllReconciliations();
	void saveReconciliation(Reconciliation reconciliation);
	void deleteReconciliation(Reconciliation reconciliation);
	List<Object[]> listReconciliationsAfterFiltring();
	List<Transaction> listTransactionJrnNotReconcilied();
	List<TransactionHost> listTransactionHostNotReconcilied();
	List<Object[]> listReconciliationsTransactionAndTransactionHost();
	
}
