package com.DieboldNixdorf.ProCompta.dao;

 
import java.util.List;
 
 

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
 
import org.springframework.stereotype.Repository;

 
import com.DieboldNixdorf.ProCompta.model.Transaction;
 

 
 
@Repository("transactionDao")
public class TransactionDaoImpl implements TransactionDao {

	
	@Autowired
	private SessionFactory sessionFactory;

	
	@Override
	public Transaction findById(Integer idTransaction) {
		Session currentSession = sessionFactory.getCurrentSession();
		@SuppressWarnings("rawtypes")
		Query theQuery = currentSession.createQuery("from Transaction where idtransaction=:theTransactionId", Transaction.class);
		theQuery.setParameter("theTransactionId", idTransaction);
		Transaction transaction = (Transaction) theQuery.getSingleResult();
		return transaction;
	}


	@Override
	public List<Transaction> findAllTransaction() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Transaction> theQuery = currentSession.createQuery("from Transaction", Transaction.class);
		List<Transaction> listTransactions = theQuery.getResultList();
		return listTransactions;
	}

	 
	@Override
	public List<String> listErreursTransaction() {
		return null;
		
		 
		 
	}


	@Override
	public List<String> listinfosTransaction() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public void saveTrasanction(Transaction transaction) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(transaction);
		
	}


	@Override
	public void deleteTransaction(Transaction transaction) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.delete(transaction);
		
	}

	 
	

	 
	}
	    
	
	
	
	
	
	
	



