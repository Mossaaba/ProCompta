package com.DieboldNixdorf.ProCompta.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.DieboldNixdorf.ProCompta.model.ErrorATM;
 

@Repository
public class ErrorATMDaoImpl implements ErrorATMDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public ErrorATM findErrorATMById(Integer idErrorATM) {
		Session currentSession = sessionFactory.getCurrentSession();
		@SuppressWarnings("rawtypes")
		Query theQuery = currentSession.createQuery("from ErrorATM where iderror_atm=:theErrorATMId", ErrorATM.class);
		theQuery.setParameter("theErrorATMId", idErrorATM);
		ErrorATM errorATM = (ErrorATM) theQuery.getSingleResult();
		return errorATM;
	 
	}

	@Override
	public List<ErrorATM> findAllErrorsATM() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<ErrorATM> theQuery = currentSession.createQuery("from ErrorATM", ErrorATM.class);
		List<ErrorATM> listErrorATM = theQuery.getResultList();
		return listErrorATM;
	}

	@Override
	public void saveErrorATM(ErrorATM errorATM) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(errorATM);

	}

	@Override
	public void deleteErrorATM(ErrorATM errorATM) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.delete(errorATM);

	}

}
