package com.DieboldNixdorf.ProCompta.dao;

 
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.DieboldNixdorf.ProCompta.model.Incident;
 
@Repository
public class IncidentDaoImpl implements IncidentDao {

	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Override
	public Incident findIncidentById(Integer idIncident) 
	{
		Session currentSession = sessionFactory.getCurrentSession();
		@SuppressWarnings("rawtypes")
		Query theQuery = currentSession.createQuery("from Incident where idincident=:theIdincidentId", Incident.class);
		theQuery.setParameter("theIdincidentId", idIncident);
		Incident incident = (Incident) theQuery.getSingleResult();
		return incident;
	}

	@Override
	public List<Incident> findAllIncidents() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Incident> theQuery = currentSession.createQuery("from Incident", Incident.class);
		List<Incident> listIncidents = theQuery.getResultList();
		return listIncidents;
	}

	@Override
	public void saveIncident(Incident incident) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(incident);
	}

	@Override
	public void deleteIncident(Incident incident) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.delete(incident);
		
	}

	 
	
	 
   
	}
	    
	
	
	
	
	
	
	



