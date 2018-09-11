package com.DieboldNixdorf.ProCompta.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.DieboldNixdorf.ProCompta.model.Host;


@Repository("hostDao")
public class HostDaoImpl implements HostDao {

    static final Logger logger = LoggerFactory.getLogger(BranchDaoImpl.class);
	
	@Autowired 
	private SessionFactory sessionFactory; 
	
	
	@Override
	public Host findHostById(int idHost) {
		 
		 Session currentSession = sessionFactory.getCurrentSession();
		 @SuppressWarnings("rawtypes")
		 Query theQuery = currentSession.createQuery("from Host where idconfiguration=:theHostId" , Host.class);
		 theQuery.setParameter("theHostId", idHost);
		 Host host =  (Host) theQuery.getSingleResult();
		 return host;
	}

	@Override
	public void saveHost(Host host) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(host);
	}

	@Override
	public void deleteHostById(int idHost) {
	 
		Session currentSession = sessionFactory.getCurrentSession();
		@SuppressWarnings("rawtypes")
		Query  theQuery = currentSession.createQuery("delete from Host where idconfiguration=:theHostId");
		theQuery.setParameter("theHostId", idHost);
		theQuery.executeUpdate();

	}

	@Override
	public List<Host> findAllHosts() {
		 
		 Session currentSession = sessionFactory.getCurrentSession();
		 Query<Host> theQuery = currentSession.createQuery("from Host " , Host.class);
		 List<Host> hosts = theQuery.getResultList();
		 return hosts;
	}

}
