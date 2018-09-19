package com.DieboldNixdorf.ProCompta.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.DieboldNixdorf.ProCompta.model.Atm;
 
import com.DieboldNixdorf.ProCompta.model.Journal;


@Repository("journalDao")
@Transactional
public class JournalDaoImpl extends AbstractDao<Integer, Journal> implements JournalDao {

	
	@Autowired
	private SessionFactory sessionFactory;
	
	@SuppressWarnings("unchecked")
    public List<Journal> findAll() {
        Criteria crit = createEntityCriteria();
        return (List<Journal>)crit.list();
    }

	@Override
	public Journal findById(int idjournal) {
		 return getByKey(idjournal);
	}

	@Override
	public void save(Journal journal) {
		
	
	}
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Journal> findAllByAtmId(int idAtm) {
		    Criteria crit = createEntityCriteria();
	        Criteria atmCriteria = crit.createCriteria("atm");
	        atmCriteria.add(Restrictions.eq("idatm", idAtm));
	        return (List<Journal>)crit.list();
	}

	@Override
	public void deleteById(int idjournal) {
		Journal journal = getByKey(idjournal);
		delete(journal);
	}

	@Override
	public void save(Journal journal, int idAtm) {
		 
	   Session currentSession = sessionFactory.getCurrentSession();
		
		Atm atm = currentSession.get(Atm.class, idAtm); 
	 
		
		atm.addJournal(journal);
		 
		currentSession.saveOrUpdate(journal);
		
	}

}
