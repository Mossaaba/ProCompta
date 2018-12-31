package com.DieboldNixdorf.ProCompta.dao;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.DieboldNixdorf.ProCompta.model.Atm;
import com.DieboldNixdorf.ProCompta.model.Incident;
import com.DieboldNixdorf.ProCompta.tools.ToolsToUse;
 
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

	@Override
	public List<Atm> find_All_ATM_DIEBOLD_NIXDORF() {
		Session currentSession = sessionFactory.getCurrentSession();	
		Query<Atm> theQuery = currentSession.createQuery("from Atm where Vendor=:theVendorName ", Atm.class);
		theQuery.setParameter("theVendorName", "DIEBOLD-NIXDORF");
		List<Atm> listATM_DIEBOLD_NIXDORF = theQuery.getResultList();
		return listATM_DIEBOLD_NIXDORF;
	}

 
	@Override
	public List<Incident> typeOfIncident() {
		
		   Session currentSession = sessionFactory.getCurrentSession();
		   @SuppressWarnings("unchecked")
		   Query<Incident> query = currentSession.createQuery("SELECT DISTINCT detailsincidents FROM Incident ");
	       List<Incident> resultList = query.getResultList();
		   return resultList;
		 
	}

	@Override
	public List<Incident> listincidentsAfterFiltring(Incident incd) {
		 
		Session currentSession = sessionFactory.getCurrentSession();
		CriteriaBuilder builder = currentSession.getCriteriaBuilder();
		CriteriaQuery<Incident> query = builder.createQuery(Incident.class);
		Root<Incident> root = query.from(Incident.class);
		query.select(root);
 
		final List<Predicate> predicates = new ArrayList<Predicate>();
		ToolsToUse tools = new ToolsToUse();
		
		if (incd.getIdAtm()!= -1 )

		{

			 

		}
		if (!incd.getDetailsincidents().equalsIgnoreCase("-1") )

		{

			predicates.add(builder.like(root.get("detailsincidents"), "%" + incd.getDetailsincidents() + "%")); 

		}
		
		
		if (  !incd.getStartingDateFilterIncident().equalsIgnoreCase("") 
			   && !incd.getFinishingDateFilterIncident().equalsIgnoreCase("") )
		{
			 try {

					        predicates.add(builder.between(root.get("incident_date"),
							tools.convertStringToDatenew(incd.getStartingDateFilterIncident()),
							tools.convertStringToDatenew(incd.getFinishingDateFilterIncident())));

				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
			 
		 
		 if (    !incd.getStartingTimeFilterIncident().equalsIgnoreCase("") 
				 && !incd.getFinisingTimeFilterIncident().equalsIgnoreCase("") )
		{
			 try {
			            predicates.add(builder.between(root.get("incident_time"),
						tools.ConvertStringToTimeTrx(incd.getStartingTimeFilterIncident()),
						tools.ConvertStringToTimeTrx(incd.getFinisingTimeFilterIncident())));
			 } catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	
		}
 
	    query.where(builder.and(predicates.toArray(new Predicate[predicates.size()])));
		Query<Incident> requet = currentSession.createQuery(query);
		@SuppressWarnings("unused")
		List<Incident> ListIncidentAfterFiltring = requet.getResultList();
		
		
		
		return ListIncidentAfterFiltring;
	}
	}
	    

