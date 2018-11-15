package com.DieboldNixdorf.ProCompta.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.DieboldNixdorf.ProCompta.model.Atm;
import com.DieboldNixdorf.ProCompta.model.Branch;
import com.DieboldNixdorf.ProCompta.model.Host;

@Repository("atmDao")
public class AtmDaoImp implements AtmDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Atm> listAtms() {

		Session currentSession = sessionFactory.getCurrentSession();
		Query<Atm> theQuery = currentSession.createQuery("from Atm", Atm.class);
		List<Atm> listAtm = theQuery.getResultList();
		return listAtm;
	}

	@Override
	public Atm findById(int idAtm) {

		Session currentSession = sessionFactory.getCurrentSession();
		@SuppressWarnings("rawtypes")
		Query theQuery = currentSession.createQuery("from Atm where idatm=:theAtmId", Atm.class);
		theQuery.setParameter("theAtmId", idAtm);
		Atm atm = (Atm) theQuery.getSingleResult();
		return atm;
	}

	@Override
	public void save(Atm atm) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(atm);
	}

	@Override
	public void saveAtm(Atm atm, int idHost, int idBranch) {

		Session currentSession = sessionFactory.getCurrentSession();
		Branch branchTemp = currentSession.get(Branch.class, idBranch);
		Host hostTemp = currentSession.get(Host.class, idHost);
		branchTemp.addAtm(atm);
		hostTemp.addAtm(atm);
		currentSession.saveOrUpdate(atm);
	}

	@Override
	public void deleteById(int idAtm) {

		Session currentSession = sessionFactory.getCurrentSession();
		@SuppressWarnings("rawtypes")
		Query theQuery = currentSession.createQuery("delete from Atm where idatm=:theAtmId");
		theQuery.setParameter("theAtmId", idAtm);
		theQuery.executeUpdate();

	}

	@Override
	public List<Atm> listAtmsByBranch(int idBranch) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Atm> theQuery = currentSession.createQuery("from Atm where idbranch=:theBrancheId ", Atm.class);
		theQuery.setParameter("theBrancheId", idBranch);
		List<Atm> listAtms = theQuery.getResultList();
		return listAtms;
	}

}
