package com.DieboldNixdorf.ProCompta.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.DieboldNixdorf.ProCompta.model.Replenishment;

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

}
