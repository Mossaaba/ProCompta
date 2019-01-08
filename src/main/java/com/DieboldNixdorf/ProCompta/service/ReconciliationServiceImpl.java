package com.DieboldNixdorf.ProCompta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.DieboldNixdorf.ProCompta.dao.ReconciliationDao;
import com.DieboldNixdorf.ProCompta.model.Reconciliation;
import com.DieboldNixdorf.ProCompta.model.Transaction;
import com.DieboldNixdorf.ProCompta.model.TransactionHost;

@Service
@Transactional
public class ReconciliationServiceImpl implements ReconciliationService {

	@Autowired
	ReconciliationDao reconciliationDao;
	
	
	
	@Override
	public Reconciliation findReconciliationById(Integer idReconciliation) {
		 
		return reconciliationDao.findReconciliationById(idReconciliation);
	}

	
	 
	@Override
	public List<Reconciliation> findAllReconciliations() {
		 
		return reconciliationDao.findAllReconciliations();
	}

	
	 
	@Override
	public void saveReconciliation(Reconciliation reconciliation) {
		reconciliationDao.saveReconciliation(reconciliation);

	}

	
 
	@Override
	public void deleteReconciliation(Reconciliation reconciliation) {
		reconciliationDao.deleteReconciliation(reconciliation);

	}

	@Override
	public List<Object[]> listReconciliationsAfterFiltring() {
		 
		return reconciliationDao.listReconciliationsAfterFiltring();
	}



	@Override
	public List<Transaction> listTransactionJrnNotReconcilied() {
		 
		return reconciliationDao.listTransactionJrnNotReconcilied();
	}



	@Override
	public List<TransactionHost> listTransactionHostNotReconcilied() {
		 
		return reconciliationDao.listTransactionHostNotReconcilied();
	}



	@Override
	public List<Object[]> listReconciliationsTransactionAndTransactionHost() {
		 
		return reconciliationDao.listReconciliationsTransactionAndTransactionHost();
	}

}
