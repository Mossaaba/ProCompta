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
import com.DieboldNixdorf.ProCompta.model.Replenishment;
import com.DieboldNixdorf.ProCompta.tools.ToolsToUse;

@Repository
public class ReplenishmentDaoImpl implements ReplenishmentDao {

	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Override
	public Replenishment findReplenishmentById(Integer idReplenishment) 
	{
		Session currentSession = sessionFactory.getCurrentSession();
		@SuppressWarnings("rawtypes")
		Query theQuery = currentSession.createQuery("from Replenishment where idreplenishment=:theReplenishmentId", Replenishment.class);
		theQuery.setParameter("theReplenishmentId", idReplenishment);
		Replenishment replenishment = (Replenishment) theQuery.getSingleResult();
		return replenishment;
	 
	}

	@Override
	public List<Replenishment> findAllReplenishments() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Replenishment> theQuery = currentSession.createQuery("from Replenishment", Replenishment.class);
		List<Replenishment> listReplenishments = theQuery.getResultList();
		return listReplenishments;
	}

	@Override
	public void saveReplenishment(Replenishment replenishment) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(replenishment);

	}

	@Override
	public void deleteReplenishment(Replenishment replenishment) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.delete(replenishment);

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
	public List<Replenishment> listReplenishmentAfterFiltring(Replenishment rplsh) {
		
		Session currentSession = sessionFactory.getCurrentSession(); 
		CriteriaBuilder builder = currentSession.getCriteriaBuilder();
		CriteriaQuery<Replenishment> query = builder.createQuery(Replenishment.class);
		Root<Replenishment> root = query.from(Replenishment.class);
		query.select(root);
		final List<Predicate> predicates = new ArrayList<Predicate>();
		ToolsToUse tools = new ToolsToUse();
		
		
		if (rplsh.getIdAtm() != -1 )

		{

			 

		}
	    if (  !rplsh.getStartingDateFilterReplenishment().equalsIgnoreCase("") 
				   && !rplsh.getFinishingDateFilterReplenishment().equalsIgnoreCase("") )
		{
		 try {

	        predicates.add(builder.between(root.get("dateReplenishment"),
			tools.convertStringToDatenew(rplsh.getStartingDateFilterReplenishment()),
			tools.convertStringToDatenew(rplsh.getFinishingDateFilterReplenishment())));

			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}
	    if (    !rplsh.getStartingTimeFilterReplenishment().equalsIgnoreCase("") 
				 && !rplsh.getFinisingTimeFilterReplenishment().equalsIgnoreCase("") )
		{
			 try {
			            predicates.add(builder.between(root.get("timeReplenishment"),
						tools.ConvertStringToTimeTrx(rplsh.getStartingTimeFilterReplenishment()),
						tools.ConvertStringToTimeTrx(rplsh.getFinisingTimeFilterReplenishment())));
			     } 
			 catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}	
		}
	    query.where(builder.and(predicates.toArray(new Predicate[predicates.size()])));
		Query<Replenishment> requet = currentSession.createQuery(query);
		 
		List<Replenishment> ListReplenishmentAfterFiltring = requet.getResultList();
		return ListReplenishmentAfterFiltring;
	}

}
