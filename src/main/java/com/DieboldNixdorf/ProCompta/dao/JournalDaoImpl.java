package com.DieboldNixdorf.ProCompta.dao;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import com.DieboldNixdorf.ProCompta.model.Atm;
import com.DieboldNixdorf.ProCompta.model.Journal;
import com.DieboldNixdorf.ProCompta.model.RegeX;
import com.DieboldNixdorf.ProCompta.service.AtmService;
import com.DieboldNixdorf.ProCompta.service.RegeXService;

@Repository("journalDao")
@Transactional
public class JournalDaoImpl extends AbstractDao<Integer, Journal> implements JournalDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private RegeXService regeXService;
	
	@Autowired
	private AtmService atmService;

	@SuppressWarnings("unchecked")
	public List<Journal> findAll() {
		Criteria crit = createEntityCriteria();
		return (List<Journal>) crit.list();
	}

	@Override
	public Journal findById(int idjournal) {
		return getByKey(idjournal);
	}

	@Override
	public void save(Journal journal) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(journal);

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Journal> findAllByAtmId(int idAtm) {
		Criteria crit = createEntityCriteria();
		Criteria atmCriteria = crit.createCriteria("atm");
		atmCriteria.add(Restrictions.eq("idatm", idAtm));
		return (List<Journal>) crit.list();
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

	@Override
	public boolean JounralExiste(String journalName) {
		Session currentSession = sessionFactory.getCurrentSession();

		@SuppressWarnings("rawtypes")
		Query theQuery = currentSession.createQuery("from Journal where nomJournal=:theNameOfTheJournal",
				Journal.class);
		theQuery.setParameter("theNameOfTheJournal", journalName);
		if (theQuery.uniqueResult() != null) {
			
			return true;
		}else {

		return false;}
	}

	@Override
	public List<String> ParseJournal(MultipartFile file  ,int idAtm ) {
		 
		Session currentSession = sessionFactory.getCurrentSession(); 
		  // -----------  get the RegX according to the ATM  -----------\\       
		Atm atm = atmService.findById(idAtm);
		
 
		@SuppressWarnings("rawtypes")
		Query query =	currentSession.createNativeQuery (" select *  "
				+ "  from regeX,etablir where regex.idregex=etablir.idregex "
				+ "  and  idtypeatm=:theAtmType  "
				+ "  and idconfiguration=:theConfigurationId order by regex.idregex ").addEntity(RegeX.class);
		query.setParameter("theAtmType", atm.getVendor());
		query.setParameter("theConfigurationId", atm.getHost().getIdHost());
		 
		
				@SuppressWarnings({ "rawtypes", "unused" })
				List<RegeX> AccordingRegeX = query.list();
		         
		        Iterator itr = AccordingRegeX.iterator();
		        while(itr.hasNext()) 
		        {
		        	
		        	    RegeX reg = (RegeX) itr.next();
		        	     System.out.println(reg.getNameRegex());
		        	    
		        	    
	              }
		        
		        
		          // save the Journal on DataBase and get th id                 \\
		        //   read teh file and in parallere compare to the according Regx \\
		       //    save the Transaction , Incident , replinshement               \\
		      //                                                                    \\
		      
		
		
		
		
		        InputStreamReader isr = null;
				try {
					isr = new InputStreamReader(file.getInputStream(),StandardCharsets.UTF_8);
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				BufferedReader br = new BufferedReader(isr);
				br.lines().forEach(
						line -> System.out.println(line)
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						);
				
				
				
		         return null;
		 
	}

}
