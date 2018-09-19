package com.DieboldNixdorf.ProCompta.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.DieboldNixdorf.ProCompta.model.Bank;


@Repository("bankDao")
public class BankDaoImpl implements BankDao {
	
	static final Logger logger = LoggerFactory.getLogger(BankDaoImpl.class);
	
	@Autowired 
	private SessionFactory sessionFactory; 
	
	@Override
	public Bank findById(int idBank) {
		Session currentSession = sessionFactory.getCurrentSession();
		 @SuppressWarnings("rawtypes")
		  Query theQuery = currentSession.createQuery("from Bank where idbank=:theBankId" , Bank.class);
		 theQuery.setParameter("theBankId", idBank);
		 Bank bank =  (Bank) theQuery.getSingleResult();
		 return bank;
	}
	
	@Override
	public List<Bank> getAllBanks() {
		 
		 Session currentSession = sessionFactory.getCurrentSession();
		 Query<Bank> theQuery = currentSession.createQuery("from Bank" , Bank.class);
		 List<Bank> banks = theQuery.getResultList();
		return banks;
	}
	
	

	@Override
	public void saveBank(Bank bank) {
		
		
		
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(bank);
	}

	@Override
	public void deleteBankById(int idBank) {
		Session currentSession = sessionFactory.getCurrentSession();
		@SuppressWarnings("rawtypes")
		Query  theQuery = currentSession.createQuery("delete from Bank where idbank=:theBankId");
		theQuery.setParameter("theBankId", idBank);
		theQuery.executeUpdate();

	}

	@Override
	public boolean isbankUnique(String abbreviation) {
		 
		  Session currentSession = sessionFactory.getCurrentSession();
		  @SuppressWarnings("rawtypes")
		  Query theQuery = currentSession.createQuery("from Bank where abbreviation=:theBankSSO" , Bank.class);
		  theQuery.setParameter("theBankSSO", abbreviation);
		  List results = theQuery.getResultList();
		  if (results.isEmpty()) {return true;}
		  else return false;
		  
		  
	}

	

}
