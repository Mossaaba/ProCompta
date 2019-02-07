package com.DieboldNixdorf.ProCompta.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.DieboldNixdorf.ProCompta.model.Atm;
import com.DieboldNixdorf.ProCompta.model.ProComptaConfig;

@Repository
public class AppConfigDaoImpl implements AppConfigDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public ProComptaConfig findById(int idConfig) {
		Session currentSession = sessionFactory.getCurrentSession();
		@SuppressWarnings("rawtypes")
		Query theQuery = currentSession.createQuery("from ProComptaConfig  where idConfig=:theConfigId", ProComptaConfig.class);
		theQuery.setParameter("theConfigId", idConfig);
		ProComptaConfig proComptaConfig = (ProComptaConfig) theQuery.getSingleResult();	
		return proComptaConfig;
	}

	@Override
	public void save(ProComptaConfig proComptaConfig) {
		 
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(proComptaConfig);
		

	}

}
