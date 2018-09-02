package com.DieboldNixdorf.ProCompta.dao;

import java.util.List;
import java.util.logging.Logger;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.DieboldNixdorf.ProCompta.model.Atm;

@Repository
public class AtmDaoImp implements AtmDao {

	private Logger logger = Logger.getLogger(getClass().getName());
	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	
	@Override
	public List<Atm> listAtms() {
		 
		Session currentSession = sessionFactory.getCurrentSession();
		
		Query<Atm> theQuery = currentSession.createQuery("from Atm", Atm.class);
		List<Atm> listAtm = theQuery.getResultList();
		
		
		return listAtm;
	}

}
