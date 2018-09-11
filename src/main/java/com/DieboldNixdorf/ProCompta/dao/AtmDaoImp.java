package com.DieboldNixdorf.ProCompta.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.DieboldNixdorf.ProCompta.model.Atm;
import com.DieboldNixdorf.ProCompta.model.Bank;
import com.DieboldNixdorf.ProCompta.model.Branch;

@Repository("atmDao")
@Transactional
public class AtmDaoImp implements AtmDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	
	
	@Override
	public List<Atm> listAtms() {
		 
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Atm> theQuery = currentSession.createQuery("from Atm", Atm.class);
		List<Atm> listAtm = theQuery.getResultList();	
		return listAtm;
	}



	@Override
	public void save() {
		
		@SuppressWarnings("unused")
		Session currentSession = sessionFactory.getCurrentSession();
		
		 
			System.out.println("Done Saving");
	 
			 
 
		
	}



	@Override
	public void saveAgence() {
		Session currentSession = sessionFactory.getCurrentSession();
		
		
		int theId = 1 ; 
		Bank bankTemp = currentSession.get(Bank.class, theId);
		Branch tempBranch = new Branch("Agence centrale", "City el bahia", "074444444", 2, "364396");
		Branch tempBranch2 = new Branch("Agence centrale2", "City el bahia2", "0744444442", 22, "3624396");
		
		
		bankTemp.add(tempBranch);
		bankTemp.add(tempBranch2);
		
		
		currentSession.save(tempBranch);
		currentSession.save(tempBranch2);
		
	
	}

}
