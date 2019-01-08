package com.DieboldNixdorf.ProCompta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.DieboldNixdorf.ProCompta.dao.TransactionHostDao;
import com.DieboldNixdorf.ProCompta.model.TransactionHost;


@Service
@Transactional
public class TransactionHostServiceImpl implements TransactionHostService {

	@Autowired
	  TransactionHostDao transactionHostDao;
	
	
	@Override
	public TransactionHost findById(Integer idTransactionHost) {
		 
		return transactionHostDao.findById(idTransactionHost);
	}

	@Override
	public List<TransactionHost> findAllTransaction() {
		 
		return transactionHostDao.findAllTransaction();
	}

	@Override
	public int saveTransaction(TransactionHost transactionHost) {
		 
		return transactionHostDao.saveTransaction(transactionHost);
	}

	@Override
	public void deleteTransaction(Integer idTransactionHost) {
		transactionHostDao.deleteTransaction(idTransactionHost);
	}

	@Override
	public List<TransactionHost> listTransactionAfterFiltring(TransactionHost trx) {
		 
		return transactionHostDao.listTransactionAfterFiltring(trx);
	}

	@Override
	public void updateTransactionHost(TransactionHost transactionHost) {
		transactionHostDao.updateTransactionHost(transactionHost);
		
	}

}
