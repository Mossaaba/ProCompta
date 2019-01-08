package com.DieboldNixdorf.ProCompta.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.DieboldNixdorf.ProCompta.model.Reconciliation;
import com.DieboldNixdorf.ProCompta.model.Transaction;
import com.DieboldNixdorf.ProCompta.model.TransactionHost;


@Service
@Transactional
public interface ReconciliationService {
	
	
	Reconciliation findReconciliationById(Integer idReconciliation);
	List<Reconciliation> findAllReconciliations();
	void saveReconciliation(Reconciliation reconciliation);
	void deleteReconciliation(Reconciliation reconciliation);
	List<Object[]> listReconciliationsAfterFiltring();
	List<Transaction> listTransactionJrnNotReconcilied();
	List<TransactionHost> listTransactionHostNotReconcilied();
	List<Object[]> listReconciliationsTransactionAndTransactionHost();

}
