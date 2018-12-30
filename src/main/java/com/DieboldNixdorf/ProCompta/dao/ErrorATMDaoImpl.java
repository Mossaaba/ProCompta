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
import com.DieboldNixdorf.ProCompta.model.ErrorATM;
import com.DieboldNixdorf.ProCompta.tools.ToolsToUse;
 

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

	@Override
	public List<Atm> find_All_ATM_DIEBOLD_NIXDORF() {
		Session currentSession = sessionFactory.getCurrentSession();	
		Query<Atm> theQuery = currentSession.createQuery("from Atm where Vendor=:theVendorName ", Atm.class);
		theQuery.setParameter("theVendorName", "DIEBOLD-NIXDORF");
		List<Atm> listATM_DIEBOLD_NIXDORF = theQuery.getResultList();
		return listATM_DIEBOLD_NIXDORF;
	 
	}

	@Override
	public List<ErrorATM> typeOfErrorATM() {
		 Session currentSession = sessionFactory.getCurrentSession();
		   @SuppressWarnings("unchecked")
		   Query<ErrorATM> query = currentSession.createQuery("SELECT DISTINCT detailErrorAtm FROM ErrorATM ");
	       List<ErrorATM> resultList = query.getResultList();
		   return resultList;
		 
	}

	@Override
	public List<ErrorATM> listErrorsAfterFiltring(ErrorATM err) {
		
		Session currentSession = sessionFactory.getCurrentSession();
		CriteriaBuilder builder = currentSession.getCriteriaBuilder();
		CriteriaQuery<ErrorATM> query = builder.createQuery(ErrorATM.class);
		Root<ErrorATM> root = query.from(ErrorATM.class);
		query.select(root);
 
		final List<Predicate> predicates = new ArrayList<Predicate>();
		ToolsToUse tools = new ToolsToUse();
		
		if (err.getIdAtm()!= -1 )

		{

			 

		}
		if (err.getDetailErrorAtm().equalsIgnoreCase("-1") )

		{

			predicates.add(builder.like(root.get("detailErrorAtm"), "%" + err.getDetailErrorAtm() + "%")); 

		}
		 if (  !err.getStartingDateFilterErrorATM().equalsIgnoreCase("") 
			   && !err.getFinishingDateFilterErrorATM().equalsIgnoreCase("") )
		{
			 try {

					        predicates.add(builder.between(root.get("dateErrorATM"),
							tools.convertStringToDatenew(err.getStartingDateFilterErrorATM()),
							tools.convertStringToDatenew(err.getFinishingDateFilterErrorATM())));

				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			
			
		}
			 
		 
		 if (    !err.getStartingTimeFilterErrorATM().equalsIgnoreCase("") 
				 && !err.getFinisingTimeFilterErrorATM().equalsIgnoreCase("") )
		{
			 try {
			            predicates.add(builder.between(root.get("incident_time"),
						tools.ConvertStringToTimeTrx(err.getStartingTimeFilterErrorATM()),
						tools.ConvertStringToTimeTrx(err.getFinisingTimeFilterErrorATM())));
			 } catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			
			
		}
		 
		 
	    query.where(builder.and(predicates.toArray(new Predicate[predicates.size()])));
		Query<ErrorATM> requet = currentSession.createQuery(query);
		@SuppressWarnings("unused")
		List<ErrorATM> ListErrorsATMAfterFiltring = requet.getResultList();
		
		
		
		return ListErrorsATMAfterFiltring;
		
	}

}
