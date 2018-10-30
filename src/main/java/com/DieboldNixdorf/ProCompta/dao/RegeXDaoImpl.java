package com.DieboldNixdorf.ProCompta.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
 
import com.DieboldNixdorf.ProCompta.model.RegeX;

@Repository
public class RegeXDaoImpl implements RegexDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<RegeX> getAllRegeX() {
		
		Session currentSession = sessionFactory.getCurrentSession();
		Query<RegeX> theQuery = currentSession.createQuery("from RegeX", RegeX.class);
		List<RegeX> listRegeXs = theQuery.getResultList();
		return listRegeXs;
	}

	@Override
	public RegeX findById(int idRegeX) {
		Session currentSession = sessionFactory.getCurrentSession();
		@SuppressWarnings("rawtypes")
		Query theQuery = currentSession.createQuery("from RegeX where idregex=:theRegeXId", RegeX.class);
		theQuery.setParameter("theRegeXId", idRegeX);
		RegeX regeX = (RegeX) theQuery.getSingleResult();
		return regeX;
	}

	@Override
	public void saveRegeX(RegeX regeX) {
		 
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(regeX);
	}

	@Override
	public void deleteRegeXById(int idRegeX) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		@SuppressWarnings("rawtypes")
		Query theQuery = currentSession.createQuery("delete from RegeX where idregex=:theRegeXId");
		theQuery.setParameter("theRegeXId", idRegeX);
		theQuery.executeUpdate();
		 

	}

}
