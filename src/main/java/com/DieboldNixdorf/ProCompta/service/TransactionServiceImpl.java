package com.DieboldNixdorf.ProCompta.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.DieboldNixdorf.ProCompta.dao.TransactionDao;
import com.DieboldNixdorf.ProCompta.model.Transaction;

@Service
@Transactional
public class TransactionServiceImpl implements TransactionService {

	@Autowired
	private TransactionDao transactionDao;

	@Override
	public Transaction findById(Integer id) {

		return transactionDao.findById(id);
	}

	@Override
	public List<Transaction> findAllTransaction() {

		return transactionDao.findAllTransaction();
	}

	@Override
	public List<String> listErreursTransaction() {

		return transactionDao.listErreursTransaction();
	}

	@Override
	public List<String> listinfosTransaction() {

		return transactionDao.listinfosTransaction();
	}

	@Override
	public void saveTrasanction(Transaction transaction) {
		transactionDao.saveTrasanction(transaction);

	}

	@Override
	public void deleteTransaction(Transaction transaction) {
		transactionDao.deleteTransaction(transaction);

	}

}