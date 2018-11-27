package com.DieboldNixdorf.ProCompta.dao;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import com.DieboldNixdorf.ProCompta.model.Atm;
import com.DieboldNixdorf.ProCompta.model.Journal;
import com.DieboldNixdorf.ProCompta.model.RegeX;
import com.DieboldNixdorf.ProCompta.model.Transaction;
import com.DieboldNixdorf.ProCompta.service.AtmService;
import com.DieboldNixdorf.ProCompta.service.RegeXService;
import com.DieboldNixdorf.ProCompta.tools.SwitchStringRegex;

@Repository("journalDao")
@Transactional
@PropertySource({ "classpath:/regeX/regeX.properties" })
public class JournalDaoImpl extends AbstractDao<Integer, Journal> implements JournalDao {

	SwitchStringRegex sw = new SwitchStringRegex();
	
	@Autowired
	private SessionFactory sessionFactory;

	@Autowired
	private RegeXService regeXService;

	@Autowired
	private AtmService atmService;


	@Value("${TRANSACTION_START}")
	String TRANSACTION_START;
 
	@Value("${CARD_NUMBER}")
	String CARD_NUMBER;

	@Value("${OP_CODE_BUFFER}")
	String OP_CODE_BUFFER;

	@Value("${PIN_ENTERED}")
	String PIN_ENTERED;

	@Value("${AMOUNT_ENTERED}")
	String AMOUNT_ENTERED;

	@Value("${CARD_TAKEN}")
	String CARD_TAKEN;
	
	@Value("${CARD_RETAINED}")
	String CARD_RETAINED;

	@Value("${CASH_REQUEST}")
	String CASH_REQUEST;

	@Value("${CASH_DISPENSED}")
	String CASH_DISPENSED;

	@Value("${CASH_PRESENTED}")
	String CASH_PRESENTED;

	@Value("${CASH_TAKEN}")
	String CASH_TAKEN;

	@Value("${CASH_RETRACTED}")
	String CASH_RETRACTED;

	@Value("${COMMUNICATION_ERROR}")
	String COMMUNICATION_ERROR;

	@Value("${CASH_PRESENT_TIMER_EXPIRED}")
	String CASH_PRESENT_TIMER_EXPIRED;

	@Value("${WRONG_PIN_ENTERED}")
	String WRONG_PIN_ENTERED;

	@Value("${CARD_EJECT_TIMER_EXPIRED}")
	String CARD_EJECT_TIMER_EXPIRED;

	@Value("${RETAIN_CARD_NOT_SUPPORTED}")
	String RETAIN_CARD_NOT_SUPPORTED;

	@Value("${ERROR_DURING_CASH_RETRACT}")
	String ERROR_DURING_CASH_RETRACT;

	@Value("${CARD_RETAINED_BY_HOST}")
	String CARD_RETAINED_BY_HOST;

	@Value("${CASH_RETRACT_CALLED_IN_ADRS}")
	String CASH_RETRACT_CALLED_IN_ADRS;

	@Value("${TRANSACTION_END}")
	String TRANSACTION_END;
	
	@Value("${HOST_DATE}")
	String HOST_DATE;
	
	@Value("${HOST_BRANCH}")
	String HOST_BRANCH;
	
	@Value("${HOST_AMOUNT}")
	String HOST_AMOUNT;        
			
	@Value("${HOST_HOUR}")
	String HOST_HOUR;		
			
	@Value("${HOST_CARD}")
	String HOST_CARD;
	
	@Value("${HOST_AUTH}")
	String HOST_AUTH;
	
	@Value("${HOST_UTRNNO}")
	String HOST_UTRNNO;
			
			
	
	

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
		} else {

			return false;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> ParseJournal(MultipartFile file, int idAtm   ) {

		Collection<String> collection = new ArrayList<String>();
		
		collection.add(TRANSACTION_START);
		collection.add(CARD_NUMBER);
		collection.add(OP_CODE_BUFFER);
		collection.add(PIN_ENTERED);
		collection.add(AMOUNT_ENTERED);
		collection.add(CARD_TAKEN);
		collection.add(CARD_RETAINED);
		collection.add(CASH_REQUEST);
		collection.add(CASH_DISPENSED);
		collection.add(CASH_PRESENTED);
		
		collection.add(HOST_UTRNNO);
		collection.add(HOST_AUTH);
		collection.add(HOST_CARD);
		collection.add(HOST_HOUR);
		collection.add(HOST_AMOUNT);
		collection.add(HOST_BRANCH);
		collection.add(HOST_DATE);
		
		collection.add(CASH_TAKEN);
		collection.add(CASH_RETRACTED);
		collection.add(COMMUNICATION_ERROR);
		collection.add(CASH_PRESENT_TIMER_EXPIRED);
		collection.add(WRONG_PIN_ENTERED);
		collection.add(CARD_EJECT_TIMER_EXPIRED);
		collection.add(RETAIN_CARD_NOT_SUPPORTED);
		collection.add(ERROR_DURING_CASH_RETRACT);
		collection.add(CARD_RETAINED_BY_HOST);
		collection.add(CASH_RETRACT_CALLED_IN_ADRS);
		collection.add(TRANSACTION_END);

		Session currentSession = sessionFactory.getCurrentSession();
		// ----------- get the RegX according to the ATM -----------\\
		Atm atm = atmService.findById(idAtm);
		
		
		

		@SuppressWarnings("rawtypes")
		Query query = currentSession.createNativeQuery(" select *  "
				+ "  from regeX,etablir where regex.idregex=etablir.idregex " + "  and  idtypeatm=:theAtmType  "
				+ "  and idconfiguration=:theConfigurationId order by regex.idregex ").addEntity(RegeX.class);
		query.setParameter("theAtmType", atm.getVendor());
		query.setParameter("theConfigurationId", atm.getHost().getIdHost());

		@SuppressWarnings({ "unused" })
		List<RegeX> AccordingRegeX = query.list();

		@SuppressWarnings("rawtypes")
		Iterator itr = AccordingRegeX.iterator();
		while (itr.hasNext()) {

			@SuppressWarnings("unused")
			RegeX reg = (RegeX) itr.next();

		}

		// save the Journal on DataBase and get th id \\
		// read teh file and in parallere compare to the according Regx \\
		// save the Transaction , Incident , replinshement \\
		// \\

		
	   
		
		
		InputStreamReader isr = null;
		try {
			isr = new InputStreamReader(file.getInputStream(), StandardCharsets.UTF_8);
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		BufferedReader br = new BufferedReader(isr);
      
		String line;
	 
		 
		try {
			while ((line = br.readLine()) != null) {

				Iterator<String> iterator = collection.iterator();

				while (iterator.hasNext()) 
				{
					 Transaction trx = new Transaction();

				      String Io =iterator.next();
					  Pattern pattern = Pattern.compile(Io.toString()); 
					  Matcher matcher = pattern.matcher(line); 
					  
					 if (matcher.find()) 
					 {
                     
				    
					  if (Io.toString().equalsIgnoreCase(TRANSACTION_START))
					  {
						  
						  System.out.println(" Starting transaction "+matcher.group(1) );
  
					  }
					    if (Io.toString().equalsIgnoreCase(CARD_NUMBER))
					  {
						  
						  System.out.println("The card Numeber is : "+matcher.group(1));
					  }
					 
					    if (Io.toString().equalsIgnoreCase(PIN_ENTERED))
					  {
						  
						  System.out.println("PIN_ENTERED OK ");
					  }
					    
					    if (Io.toString().equalsIgnoreCase(AMOUNT_ENTERED))
					  {
						  
						  System.out.println("AMOUNT_ENTERED : "+matcher.group(1));
					  }
					   if (Io.toString().equalsIgnoreCase(CASH_REQUEST))
					  {
						  
						  System.out.println("CASH_REQUEST : "+matcher.group(1));
					  }
					   if (Io.toString().equalsIgnoreCase(CASH_DISPENSED))
					  {
						  
						  System.out.println("CASH_DISPENSED : "+matcher.group(1));
					  }
					   if (Io.toString().equalsIgnoreCase(CASH_PRESENTED))
					  {
						  
						  System.out.println("CASH_PRESENTED OK ");
					  }
					   
					   if (Io.toString().equalsIgnoreCase(CASH_TAKEN))
					  {
						  
						  System.out.println("CASH_TAKEN OK ");
					  }
					   
					  if (Io.toString().equalsIgnoreCase(HOST_DATE))
						  {
							  
							  System.out.println("HOST_DATE : "+matcher.group(1));
						  }
					  if (Io.toString().equalsIgnoreCase(HOST_BRANCH))
						  {
							  
							  System.out.println("HOST_BRANCH : "+matcher.group(1));
						  }
					   
					  if (Io.toString().equalsIgnoreCase(HOST_AMOUNT))
						  {
							  
							  System.out.println("HOST_AMOUNT : "+matcher.group(1));
						  }
					  if (Io.toString().equalsIgnoreCase(HOST_HOUR))
						  {
							  
							  System.out.println("HOST_HOUR : "+matcher.group(1));
						  }
					   
					   
					  if (Io.toString().equalsIgnoreCase(HOST_CARD))
						  {
							  
							  System.out.println("HOST_CARD : "+matcher.group(1));
						  }
					   
					   if (Io.toString().equalsIgnoreCase(HOST_UTRNNO))
						  {
							  
							  System.out.println("HOST_UTRNNO : "+matcher.group(1));
						  }
					   
					   if (Io.toString().equalsIgnoreCase(HOST_AUTH))
						  {
							  
							  System.out.println("HOST_AUTH : "+matcher.group(1));
						  }   
					   
					   if (Io.toString().equalsIgnoreCase(CASH_RETRACTED))
					  {
						  
						  System.out.println("CASH_RETRACTED : ");
					  }
					   if (Io.toString().equalsIgnoreCase(COMMUNICATION_ERROR))
					  {
						  
						  System.out.println("COMMUNICATION  : "+matcher.group(1));
					  }
					   if (Io.toString().equalsIgnoreCase(CASH_PRESENT_TIMER_EXPIRED))
					  {
						  
						  System.out.println("CASH_PRESENT_TIMER_EXPIRED : ");
					  }
					   if (Io.toString().equalsIgnoreCase(WRONG_PIN_ENTERED))
					  {
						  
						  System.out.println("WRONG_PIN_ENTERED : ");
					  }
					   if (Io.toString().equalsIgnoreCase(CARD_EJECT_TIMER_EXPIRED))
					  {
						  
						  System.out.println("CARD_EJECT_TIMER_EXPIRED : ");
					  }
					   if (Io.toString().equalsIgnoreCase(RETAIN_CARD_NOT_SUPPORTED))
					  {
						  
						  System.out.println("RETAIN_CARD_NOT_SUPPORTED : ");
					  }
					   if (Io.toString().equalsIgnoreCase(ERROR_DURING_CASH_RETRACT))
					  {
						  
						  System.out.println("ERROR_DURING_CASH_RETRACT : ");
					  }
					   if (Io.toString().equalsIgnoreCase(CARD_RETAINED_BY_HOST))
					  {
						  
						  System.out.println("CARD_RETAINED_BY_HOST : ");
					  }
					   if (Io.toString().equalsIgnoreCase(CASH_RETRACT_CALLED_IN_ADRS))
					  {
						  
						  System.out.println("CASH_RETRACT_CALLED_IN_ADRS : ");
					  }
					      
					   if (Io.toString().equalsIgnoreCase(CARD_TAKEN))
					  {
						  
						  System.out.println("CARD_TAKEN ok ");
					  }
					  
					   if (Io.toString().equalsIgnoreCase(TRANSACTION_END))
					  {
						  
						  System.out.println(" TRANSACTION_END " );
						  
					  }
					 
					   
					 
					  
					  
					  
						 
						 
						 
						 
                     
					  
					 }
					 

				}

			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;

	}

}
