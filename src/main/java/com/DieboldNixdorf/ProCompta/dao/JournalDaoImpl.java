package com.DieboldNixdorf.ProCompta.dao;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.sql.Date;
import java.text.ParseException;
import java.util.ArrayList;
 
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
 

import org.apache.commons.io.FilenameUtils;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Repository;
 
import org.springframework.web.multipart.MultipartFile;
import com.DieboldNixdorf.ProCompta.model.Atm;
import com.DieboldNixdorf.ProCompta.model.ErrorATM;
import com.DieboldNixdorf.ProCompta.model.Incident;
import com.DieboldNixdorf.ProCompta.model.Journal;
 
import com.DieboldNixdorf.ProCompta.model.Replenishment;
import com.DieboldNixdorf.ProCompta.model.Transaction;
import com.DieboldNixdorf.ProCompta.service.AtmService;
import com.DieboldNixdorf.ProCompta.service.ErrorATMService;
import com.DieboldNixdorf.ProCompta.service.IncidentService;
import com.DieboldNixdorf.ProCompta.service.JounalService;
import com.DieboldNixdorf.ProCompta.service.ReplenishmentService;
import com.DieboldNixdorf.ProCompta.service.TransactionService;
import com.DieboldNixdorf.ProCompta.tools.SwitchStringRegex;
import com.DieboldNixdorf.ProCompta.tools.ToolsToUse;

 

@Repository
@PropertySource({ "classpath:/regeX/regeX.properties" })
public class JournalDaoImpl extends AbstractDao<Integer, Journal> implements JournalDao {

	SwitchStringRegex sw = new SwitchStringRegex();
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private AtmService atmService;
	
	@Autowired
	private JounalService jService;
	
	@Autowired 
	private TransactionService tService;
	
	@Autowired 
	private IncidentService iService;
	
	@Autowired 
	private ReplenishmentService rService;
	
	@Autowired 
	private ErrorATMService eService;
	
	
/* ___________________________________________________
 *               
 *                T R A N S A C T I O N  
 * ___________________________________________________
 */

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

	@Value("${COMMUNICATION_TRANSACTION_ERROR}")
	String COMMUNICATION_TRANSACTION_ERROR;

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
	
	@Value("${TYPE_TRANSACTION}")
	String TYPE_TRANSACTION;

	
	
	/* ___________________________________________________
	 *               
	 *                H O S T  
	 * ___________________________________________________
	 */
	
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
	
	@Value("${HOST_INFO_TRANSACTION}")
	String HOST_INFO_TRANSACTION;
	
			
	/* ___________________________________________________
	 *               
	 *                I N C I D E N T   
	 * ___________________________________________________
	 */		

	@Value("${INCIDENT_ATM}")
	String INCIDENT_ATM;
	
	/* ___________________________________________________
	 *               
	 *                R E P L A N I S H E M E N T    
	 * ___________________________________________________
	 */	
	
	@Value("${START_REPLENISHMENT}")
	String START_REPLENISHMENT;
	
	
	@Value("${FINISH_REPLENISHMENT}")
	String FINISH_REPLENISHMENT;
	
	@Value("${START_REPLENISHMENT_INDICATOR}")
	String START_REPLENISHMENT_INDICATOR;
	
	 
	@Value("${FINISH_REPLENISHMENT_INDICATOR}")
	String FINISH_REPLENISHMENT_INDICATOR;
	
	
	/* ___________________________________________________
	 *               
	 *                E R R O R S    
	 * ___________________________________________________
	 */	
	@Value("${ERROR_ATM}")
	String ERROR_ATM;
	
	@Value("${ERROR_ATM_WITHOUT_CODE}")
	String ERROR_ATM_WITHOUT_CODE;
	
	

	@SuppressWarnings("unchecked")
	public List<Journal> findAll() {
		Criteria crit = createEntityCriteria();
		return (List<Journal>) crit.list();
	}

	@Override
	public Journal findById(int idjournal) {
		return getByKey(idjournal);
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
	public int saveJournal(Journal journal, int idAtm) {

		Session currentSession = sessionFactory.getCurrentSession();
		Atm atm = currentSession.get(Atm.class, idAtm);
		atm.addJournal(journal);
		Integer idJournal = (Integer) currentSession.save(journal);
		return idJournal;
		
		
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

	
 
	@Override
	public List<String> ParseJournal(MultipartFile file, int idAtm ) {

		Collection<String> collection = new ArrayList<String>();
		Collection<String> collectionNCR = new ArrayList<String>();
		/* ___________________________________________________
		 *               
		 *                T R A N S A C T I O N  
		 * ___________________________________________________
		 */
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
		collection.add(CASH_TAKEN);
		collection.add(CASH_RETRACTED);
		collection.add(COMMUNICATION_TRANSACTION_ERROR);
		collection.add(CASH_PRESENT_TIMER_EXPIRED);
		collection.add(WRONG_PIN_ENTERED);
		collection.add(CARD_EJECT_TIMER_EXPIRED);
		collection.add(RETAIN_CARD_NOT_SUPPORTED);
		collection.add(ERROR_DURING_CASH_RETRACT);
		collection.add(CARD_RETAINED_BY_HOST);
		collection.add(CASH_RETRACT_CALLED_IN_ADRS);
		collection.add(TRANSACTION_END);
		/* ___________________________________________________
		 *               
		 *                H O S T  
		 * ___________________________________________________
		 */
		collection.add(TYPE_TRANSACTION);
		collection.add(HOST_UTRNNO);
		collection.add(HOST_AUTH);
		collection.add(HOST_CARD);
		collection.add(HOST_HOUR);
		collection.add(HOST_AMOUNT);
		collection.add(HOST_BRANCH);
		collection.add(HOST_DATE);
		
		collectionNCR.add(TYPE_TRANSACTION);
		collectionNCR.add(HOST_UTRNNO);
		collectionNCR.add(HOST_AUTH);
		collectionNCR.add(HOST_CARD);
		collectionNCR.add(HOST_HOUR);
		collectionNCR.add(HOST_AMOUNT);
		collectionNCR.add(HOST_BRANCH);
		collectionNCR.add(HOST_DATE);
		collectionNCR.add(HOST_INFO_TRANSACTION);
		
		
		/* ___________________________________________________
		 *               
		 *                I N C I D E N T   
		 * ___________________________________________________
		 */		
		collection.add(INCIDENT_ATM);
		
		/* ___________________________________________________
		 *               
		 *                R E P L A N I S H E M E N T    
		 * ___________________________________________________
		 */	
		
		
		collection.add(FINISH_REPLENISHMENT_INDICATOR);
		
		collection.add(START_REPLENISHMENT_INDICATOR);
		
		
		/* ___________________________________________________
		 *               
		 *                E R R O R S    
		 * ___________________________________________________
		 */	
		collection.add(ERROR_ATM);
		collection.add(ERROR_ATM_WITHOUT_CODE);
		
		
		
		

		@SuppressWarnings("unused")
		Session currentSession = sessionFactory.getCurrentSession();
		// ----------- get the RegX according to the ATM -----------\\
		Atm atm = atmService.findById(idAtm);
		    
 /*|_________________________________________________________________________________________________|
  *|_________________________________________________________________________________________________|              
  *|                                                                                                 |
  *|                                                                                                 |
  *|                                    W I N C O R N I X D O R F                                    |
  *|_________________________________________________________________________________________________|               
  *|_________________________________________________________________________________________________|
  */		
		if (atm.getVendor().equalsIgnoreCase("Wincor-Nixdorf"))
		
		{
			
			// ------ save the Journal on DataBase and get the id ----- \\
			Journal jrn = new Journal();
			jrn.setAtm(atm);
			String JournalName = FilenameUtils.removeExtension(file.getOriginalFilename());
			
			ToolsToUse toolsProCompta = new ToolsToUse();
			
			try {
				jrn.setDateJournal(toolsProCompta.ConvertStringToDate(JournalName));
			} catch (ParseException e2) {
				e2.printStackTrace();
			}
			jrn.setNomJournal(JournalName);
			@SuppressWarnings("unused")
			int idjournal = jService.saveJournal(jrn, idAtm);
			
	 
			InputStreamReader isr = null;
			try {
				isr = new InputStreamReader(file.getInputStream(), StandardCharsets.UTF_8);
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			BufferedReader br = new BufferedReader(isr);
	      
			String line;
			
		    
			Transaction trx = new Transaction();
			Incident incd = new Incident();
			ErrorATM ErrATM = new ErrorATM();
			Replenishment Replsh = new Replenishment();
			try {
				while ((line = br.readLine()) != null) 
				{
				
					Iterator<String> iterator = collection.iterator();
					
					trx.setJournal(jrn);
					incd.setJournal(jrn);
					ErrATM.setJournal(jrn);
					Replsh.setJournal(jrn);

					while (iterator.hasNext()) 
					{
						  
					      String Io =iterator.next();
						  Pattern pattern = Pattern.compile(Io.toString()); 
						  Matcher matcher = pattern.matcher(line); 
						
						
						  
						 if (matcher.find()) 
						 {
							 
	/*------------------------------------------------------------------------------------------------------- 
	|                                          _______________________                                       |
	|                                                                                                        |
	|                                           T R A N S A C T I O N                                        |
	|                                          _______________________                                       |
	|                                                                                                        |
	*---------------------------------------------------------------------------------------------------------*/
							 
							 
							 
							 
							 /*==========================================================================*\
							 |                            TRANSACTIO START                               |
							 \*===========================================================================*/
							 
					    
						  if (Io.toString().equalsIgnoreCase(TRANSACTION_START))
						  {
							  try {
								trx.setStartingDate((Date) toolsProCompta.ConvertStringToDate(JournalName));
								trx.setFinishingDate((Date) toolsProCompta.ConvertStringToDate(JournalName));
								trx.setStartingTime(toolsProCompta.ConevretStringToTime(matcher.group(1)));
							   } catch (ParseException e) {
								e.printStackTrace();
							   }
						  }
						     /*==========================================================================*\
							 |                            CARD NUMBRR                                    |
							 \*===========================================================================*/
						    if (Io.toString().equalsIgnoreCase(CARD_NUMBER))
						  {
							  
							  trx.setCardNumber(matcher.group(1));
						  }
						     /*==========================================================================*\
							 |                            AMOUNT ENTERED                                 |
							 \*===========================================================================*/
						    
						    if (Io.toString().equalsIgnoreCase(AMOUNT_ENTERED))
						  {
							  
							  trx.setAmountEntred(matcher.group(1));
						  }
						     /*==========================================================================*\
							 |                               CASH REQUEST                                |
							 \*===========================================================================*/
						   if (Io.toString().equalsIgnoreCase(CASH_REQUEST))
						  {
							   trx.setCashRequest(matcher.group(1));
						  }
						     /*==========================================================================*\
							 |                               CASH DISPENSED                              |
							 \*===========================================================================*/
						   
						   if (Io.toString().equalsIgnoreCase(CASH_DISPENSED))
						  {
							  
							  
							   trx.setCashDispensed(matcher.group(1));
							   
							   @SuppressWarnings("rawtypes")
							   ArrayList ret=  toolsProCompta.ConvertCashDispenseToCassette(matcher.group(1)); 
							   
							   for (int i=0;i<ret.size();i++) {
								   
								   @SuppressWarnings("rawtypes")
								ArrayList ll =(ArrayList)ret.get(i);
								   
								   if(ll.get(0).toString().equalsIgnoreCase("1"))
								   {
									   trx.setCassette1(Integer.parseInt(ll.get(1).toString())  );
								   }else if(ll.get(0).toString().equalsIgnoreCase("2"))
								   {
									   trx.setCassette2(Integer.parseInt(ll.get(1).toString())  );
								   }else if(ll.get(0).toString().equalsIgnoreCase("3"))
								   {
									   trx.setCassette3(Integer.parseInt(ll.get(1).toString())  );
								   }else if(ll.get(0).toString().equalsIgnoreCase("4"))
								   {
									   trx.setCassette4(Integer.parseInt(ll.get(1).toString())  );
								   } 
									   
									   
							   }
							   
							   
							  
						  }
						   
						     /*==========================================================================*\
							 |                               CASH PRESENTED                              |
							 \*===========================================================================*/
						   
						   if (Io.toString().equalsIgnoreCase(CASH_PRESENTED))
						  {
							  trx.setCashPresented(true); 
							   
							 
						  }
						   
						     /*==========================================================================*\
							 |                                CASH TAKEN                                 |
							 \*===========================================================================*/
						   
						   if (Io.toString().equalsIgnoreCase(CASH_TAKEN))
						  {
							  trx.setCashTaken(true);
							 
						  }
						     
						  
						    /*==========================================================================*\
							 |                               TYPE TRANSACTION                           |
							 \*===========================================================================*/
						  if (Io.toString().equalsIgnoreCase(TYPE_TRANSACTION))
						  {
							  trx.setTransactionType(matcher.group(1));; 
						  }
						  
						
						     /*==========================================================================*\
							 |                               CASH  RETRACTED                             |
							 \*===========================================================================*/
						   
						   if (Io.toString().equalsIgnoreCase(CASH_RETRACTED))
						  {
							  trx.setErrorTransaction("CASH RETRACTED");
							 
						  }
						   /*==========================================================================*\
							 |                           COMMUNICATION TRANSACTION ERROR                 |
							 \*===========================================================================*/
						   if (Io.toString().equalsIgnoreCase(COMMUNICATION_TRANSACTION_ERROR))
						  {
							   
							   trx.setErrorTransaction(matcher.group(2));
							   
						  }
						     
						     /*==========================================================================*\
							 |                           CASH PRESENT TIMER EXPIRED                      |
							 \*===========================================================================*/
						   
						   if (Io.toString().equalsIgnoreCase(CASH_PRESENT_TIMER_EXPIRED))
						  {
							  trx.setErrorTransaction("CASH_PRESENT_TIMER_EXPIRED"); 
						  }
						   
						     /*==========================================================================*\
							 |                           WRONG_PIN_ENTERED                               |
							 \*===========================================================================*/
						   
						   if (Io.toString().equalsIgnoreCase(WRONG_PIN_ENTERED))
						  {
							  
							  trx.setErrorTransaction("WRONG_PIN_ENTERED");
							  
						  }
						     /*==========================================================================*\
							 |                           CARD EJECT TIMER EXPIRED                        |
							 \*===========================================================================*/
						   if (Io.toString().equalsIgnoreCase(CARD_EJECT_TIMER_EXPIRED))
						  {
							  
							  trx.setErrorTransaction("CARD_EJECT_TIMER_EXPIRED");
							  
						  }
						   
						     /*==========================================================================*\
							 |                          RETAIN CARD NOT SUPPORTED                        |
							 \*===========================================================================*/
						   if (Io.toString().equalsIgnoreCase(RETAIN_CARD_NOT_SUPPORTED))
						  {
							  trx.setErrorTransaction("RETAIN_CARD_NOT_SUPPORTED");
							  
						  }
						     /*==========================================================================*\
							 |                          ERROR DURING CASH RETRACT                        |
							 \*===========================================================================*/
						   if (Io.toString().equalsIgnoreCase(ERROR_DURING_CASH_RETRACT))
						  {
							  trx.setErrorTransaction("ERROR_DURING_CASH_RETRACT");
							  
						  }
						   
						     /*==========================================================================*\
							 |                          CARD RETAINED BY HOST                            |
							 \*===========================================================================*/
						   
						   if (Io.toString().equalsIgnoreCase(CARD_RETAINED_BY_HOST))
						  {

							  trx.setErrorTransaction("CARD_RETAINED_BY_HOST");
						  }
						     /*==========================================================================*\
							 |                          CASH RETRACT CALLED IN ADRS                      |
							 \*===========================================================================*/
						   
						   if (Io.toString().equalsIgnoreCase(CASH_RETRACT_CALLED_IN_ADRS))
						  {
							  trx.setErrorTransaction("CASH_RETRACT_CALLED_IN_ADRS");
						  }
						   
						     /*==========================================================================*\
							 |                               CARD TAKEN                                  |
							 \*===========================================================================*/
						      
						   if (Io.toString().equalsIgnoreCase(CARD_TAKEN))
						  {

							  trx.setCardTaken(true);
						  }
						      /*==========================================================================*\
							 |                               TRANSACTION END                                  |
							 \*===========================================================================*/
						  
						   if (Io.toString().equalsIgnoreCase(TRANSACTION_END))
						  {
							  
							  System.out.println(" TRANSACTION_END " );
							  trx.setFinishingTime(toolsProCompta.ConevretStringToTime(matcher.group(1)));
							  
							  tService.saveTrasanction(trx);
							  trx=new Transaction();
							  
						  }
	   /*------------------------------------------------------------------------------------------------------- 
	   |                                       _________________________                                        |
	   |                                                                                                        |
	   |                                              H  O  S  T                                                |
	   |                                       _________________________                                        |
	   |                                                                                                        |
	   *---------------------------------------------------------------------------------------------------------*/	
						     /*==========================================================================*\
							 |                               HOST   DATE                                 |
							 \*===========================================================================*/
						   
						  if (Io.toString().equalsIgnoreCase(HOST_DATE))
							  {
								  
								  
								  try {
									trx.setTransactionDateHost((toolsProCompta.ConvertStringHostToDate(matcher.group(1))));
								} catch (ParseException e) {
									e.printStackTrace();
								}
							  }
						     /*==========================================================================*\
							 |                               HOST BRANCH                                 |
							 \*===========================================================================*/
						  
						  if (Io.toString().equalsIgnoreCase(HOST_BRANCH))
							  {
							  trx.setTransactionHostBranch(matcher.group(1));
							  
							  }
						  
						     /*==========================================================================*\
							 |                               HOST  AMOUNT                                 |
							 \*===========================================================================*/
						   
						  if (Io.toString().equalsIgnoreCase(HOST_AMOUNT))
							  {
							  String amountR= matcher.group(1);
							  if (amountR.contains(",")) 
							  {
								   amountR =  amountR.replaceAll(",", "");
							  }
							      
								  trx.setTransactionHostAmount(Double.parseDouble(amountR));
							  }
						  
						     /*==========================================================================*\
							 |                               HOST    Time                                |
							 \*===========================================================================*/
						  
						  if (Io.toString().equalsIgnoreCase(HOST_HOUR))
							  {
								  trx.setTransactionHostTime(toolsProCompta.ConevretStringToTime(matcher.group(1))); 
							  }
						     /*==========================================================================*\
							 |                               HOST    CARD                                |
							 \*===========================================================================*/
						  
						  
						  if (Io.toString().equalsIgnoreCase(HOST_CARD))
							  {
								  
								  trx.setTransaction_host_card(matcher.group(1));
							  }
						  
						     /*==========================================================================*\
							 |                               HOST   UTRNNO                               |
							 \*===========================================================================*/
						   
						   if (Io.toString().equalsIgnoreCase(HOST_UTRNNO))
							  {
								  trx.setUTRNNO(matcher.group(1));
							  }
						     /*==========================================================================*\
							 |                               HOST   AUTH                                 |
							 \*===========================================================================*/
						   
						   if (Io.toString().equalsIgnoreCase(HOST_AUTH))
							  {
								  trx.setTaransaction_AUTH(matcher.group(1));
							  }
						   
	   /*------------------------------------------------------------------------------------------------------- 
	   |                                       _________________________                                        |
	   |                                                                                                        |
	   |                                       R E P L E N I S H M E N T                                        |
	   |                                       _________________________                                        |
	   |                                                                                                        |
	   *---------------------------------------------------------------------------------------------------------*/	
						    
						   
						   if (Io.toString().equalsIgnoreCase(START_REPLENISHMENT_INDICATOR))
							  {
							   String newLineBefor = "";
							   
							   if (line.contains("CASH COUNTERS BEFOR")) 
							      {
								   newLineBefor = line;
										 
							    	 for (int i = 0; i <= 5; i++) 
										 {
							    		 
							    		     line = br.readLine();
							    		     newLineBefor = 	newLineBefor + line;
										}
										  
										  
								  } 
							   
							   
							   
							   Pattern patternRepBefor = Pattern.compile(START_REPLENISHMENT); 
							   Matcher MathcerRep = patternRepBefor.matcher(newLineBefor);
							   
							   if (MathcerRep.find()) {
								   
								   Replsh.setDateReplenishment((Date) toolsProCompta.ConvertStringToDate(JournalName));
								   Replsh.setTimeReplenishment(toolsProCompta.ConevretStringToTime(MathcerRep.group(1)));
									   
								   Replsh.setCassetteOneValueBefor(Integer.parseInt(MathcerRep.group(2)));
								   Replsh.setCassetteOneBefor(Integer.parseInt(MathcerRep.group(3)));
								   
								   Replsh.setCassetteTwoValueBefor(Integer.parseInt(MathcerRep.group(4)));
								   Replsh.setCassetteTwoBefor(Integer.parseInt(MathcerRep.group(5)));
								   
								   Replsh.setCassetteThreeValueBefor(Integer.parseInt(MathcerRep.group(6)));
								   Replsh.setCassetteThreeBefor(Integer.parseInt(MathcerRep.group(7)));
								   
								   Replsh.setCassetteFourValueBefor(Integer.parseInt(MathcerRep.group(8)));
								   Replsh.setCassetteFourBefor(Integer.parseInt(MathcerRep.group(9)));
								   
								   Replsh.setCassetteRejectBefor(Integer.parseInt(MathcerRep.group(10)));
								   Replsh.setCassetteRetractBefor(Integer.parseInt(MathcerRep.group(11)));
									    
								  
								   
							   }
							  
								   
							  }
						   
						   if (Io.toString().equalsIgnoreCase(FINISH_REPLENISHMENT_INDICATOR))
							  
						   {
							   String newLineAfter = "";
							   
							   
							   
							   if (line.contains("CASH COUNTERS AFTER")) 
							      {
								   newLineAfter = line;
										 
							    	 for (int i = 0; i <= 5; i++) 
										 {
							    		     line = br.readLine();
							    		     newLineAfter = 	newLineAfter + line;
										}
										  
										  
								  } 
							   
							   
							   Pattern patternRepAfter = Pattern.compile(FINISH_REPLENISHMENT); 
							   Matcher MathcerRepAfter = patternRepAfter.matcher(newLineAfter);
							   
							   if (MathcerRepAfter.find()) {
							   Replsh.setCassetteOneValueAfter(Integer.parseInt(MathcerRepAfter.group(2)));
							   Replsh.setCassetteOneAfter(Integer.parseInt(MathcerRepAfter.group(3)));
							   
							   Replsh.setCassetteTwoValueAfter(Integer.parseInt(MathcerRepAfter.group(4)));
							   Replsh.setCassetteTwoAfter(Integer.parseInt(MathcerRepAfter.group(5)));
							   
							   
							   Replsh.setCassetteThreeValueAfter(Integer.parseInt(MathcerRepAfter.group(6)));
							   Replsh.setCassetteThreeAfter(Integer.parseInt(MathcerRepAfter.group(7)));
							   
							   Replsh.setCassetteFourValueAfter(Integer.parseInt(MathcerRepAfter.group(8)));
							   Replsh.setCassetteFourAfter(Integer.parseInt(MathcerRepAfter.group(9)));
							   
							   Replsh.setCassetteRejectAfter(Integer.parseInt(MathcerRepAfter.group(10)));
							   Replsh.setCassetteRetractAfter(Integer.parseInt(MathcerRepAfter.group(11)));
							   
							   
							       rService.saveReplenishment(Replsh);
							       Replsh = new Replenishment();
							   }
								   
							  }
						   
						 
	   /*------------------------------------------------------------------------------------------------------- 
	   |                                          _______________________                                       |
	   |                                                                                                        |
	   |                                           I N C I D E N T E S                                          |
	   |                                          _______________________                                       |
	   |                                                                                                        |
	   *---------------------------------------------------------------------------------------------------------*/					   
						   /*==========================================================================*\
							 |                           COMMUNICATION TRANSACTION ERROR                 |
							 \*===========================================================================*/
						   if (Io.toString().equalsIgnoreCase(INCIDENT_ATM))
						  {
							   
							   incd.setDetailsincidents(matcher.group(2));
							   incd.setIncident_date((Date) toolsProCompta.ConvertStringToDate(JournalName));
							   incd.setIncident_time(toolsProCompta.ConevretStringToTime(matcher.group(1)));
						 
							   iService.saveIncident(incd);
							   incd = new Incident();
							   
						  }
						  
	   /*------------------------------------------------------------------------------------------------------- 
	   |                                          _______________________                                       |
	   |                                                                                                        |
	   |                                               E R R O R E                                              |
	   |                                          _______________________                                       |
	   |                                                                                                        |
	   *---------------------------------------------------------------------------------------------------------*/					  
						   if (Io.toString().equalsIgnoreCase(ERROR_ATM))
							  {
								   
							   
							   ErrATM.setDateErrorATM((Date) toolsProCompta.ConvertStringToDate(JournalName));
							   ErrATM.setTimeErrorATM(toolsProCompta.ConevretStringToTime(matcher.group(1)));
							   ErrATM.setDetailErrorAtm(matcher.group(2));
							   ErrATM.setCodeErrorAtm(matcher.group(3));
							   eService.saveErrorATM(ErrATM);
							   ErrATM = new ErrorATM();
								   
							  }
						   if (Io.toString().equalsIgnoreCase(ERROR_ATM_WITHOUT_CODE))
							  {
								   
							   
							   ErrATM.setDateErrorATM((Date) toolsProCompta.ConvertStringToDate(JournalName));
							   ErrATM.setTimeErrorATM(toolsProCompta.ConevretStringToTime(matcher.group(1)));
							   ErrATM.setDetailErrorAtm(matcher.group(2));
							   ErrATM.setCodeErrorAtm("none");
							   eService.saveErrorATM(ErrATM);
							   ErrATM = new ErrorATM();
								   
							  }
							 
						  
						 }
						 

					}

				}
			} catch (IOException e) {
				e.printStackTrace();
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			
		}
		
 /*|_________________________________________________________________________________________________|
  *|_________________________________________________________________________________________________|              
  *|                                                                                                 |
  *|                                                                                                 |
  *|                                             N C R                                               |
  *|_________________________________________________________________________________________________|               
  *|_________________________________________________________________________________________________|
  */		
		
		else if (atm.getVendor().equalsIgnoreCase("NCR")) 
		
		
		{
			Journal jrn = new Journal();
			jrn.setAtm(atm);
			String JournalName = FilenameUtils.removeExtension(file.getOriginalFilename());
			
			
			   Pattern patternJournalNCR = Pattern.compile("(NCR\\W\\w+)_([0-2][0-9][0-9][0-9][0-1][0-9][0-3][0-9])\\d+_EJDATA"); 
			   Matcher MathcerJournalNCR = patternJournalNCR.matcher(JournalName);
			
			   ToolsToUse toolsProCompta = new ToolsToUse();
			   if (MathcerJournalNCR.find()) 
			   {
				   
				   String newJournalNCRname="";
				   newJournalNCRname = MathcerJournalNCR.group(1)+"_"+MathcerJournalNCR.group(2) ; 
				   
				   try {
						jrn.setDateJournal(toolsProCompta.ConvertStringToDate(MathcerJournalNCR.group(2)));
					} catch (ParseException e2) {
						e2.printStackTrace();
					}
				     jrn.setNomJournal(newJournalNCRname);
					@SuppressWarnings("unused")
					int idjournal = jService.saveJournal(jrn, idAtm);   
			   }
			   
			   InputStreamReader isr = null;
				try {
					isr = new InputStreamReader(file.getInputStream(), StandardCharsets.UTF_8);
				} catch (IOException e1) {
					e1.printStackTrace();
				}
				BufferedReader br = new BufferedReader(isr);
		      
				String line;
           
				Transaction trx_NCR= new Transaction();
				Incident incd_NCR = new Incident();
				ErrorATM ErrATM_NCR = new ErrorATM();
				Replenishment Replsh_NCR = new Replenishment();
			
			
				try {
					while ((line = br.readLine()) != null) 
					{
					
						Iterator<String> iterator = collectionNCR.iterator();
						
						trx_NCR.setJournal(jrn);
					  	while (iterator.hasNext()) 
						{
							  
						      String Io =iterator.next();
							  Pattern pattern = Pattern.compile(Io.toString()); 
							  Matcher matcher = pattern.matcher(line); 
							  
							  
							  if (matcher.find()) 
								 {
								  
								  /*------------------------------------------------------------------------------------------------------- 
								   |                                       _________________________                                        |
								   |                                                                                                        |
								   |                                              H  O  S  T                                                |
								   |                                       _________________________                                        |
								   |                                                                                                        |
								   *---------------------------------------------------------------------------------------------------------*/	
													     /*==========================================================================*\
														 |                               HOST   DATE                                 |
														 \*===========================================================================*/
													   
													     if (Io.toString().equalsIgnoreCase(HOST_DATE))
														  {
															  
															  
															  try {
																  trx_NCR.setTransactionDateHost((toolsProCompta.ConvertStringHostToDate(matcher.group(1))));
															} catch (ParseException e) {
																e.printStackTrace();
															}
														  }
													     /*==========================================================================*\
														 |                               HOST BRANCH                                 |
														 \*===========================================================================*/
													  
													  if (Io.toString().equalsIgnoreCase(HOST_BRANCH))
														  {
														  trx_NCR.setTransactionHostBranch(matcher.group(1));
														  
														  }
													  
													     /*==========================================================================*\
														 |                               HOST  AMOUNT                                 |
														 \*===========================================================================*/
													   
													  if (Io.toString().equalsIgnoreCase(HOST_AMOUNT))
														  {
														  String amountR= matcher.group(1);
														  if (amountR.contains(",")) 
														  {
															   amountR =  amountR.replaceAll(",", "");
														  }
														      
														  trx_NCR.setTransactionHostAmount(Double.parseDouble(amountR));
														  }
													  
													     /*==========================================================================*\
														 |                               HOST    Time                                |
														 \*===========================================================================*/
													  
													  if (Io.toString().equalsIgnoreCase(HOST_HOUR))
														  {
														  try {
															trx_NCR.setTransactionHostTime(toolsProCompta.ConevretStringToTime(matcher.group(1)));
														} catch (ParseException e) {
															// TODO Auto-generated catch block
															e.printStackTrace();
														} 
														  }
													     /*==========================================================================*\
														 |                               HOST    CARD                                |
														 \*===========================================================================*/
													  
													  
													  if (Io.toString().equalsIgnoreCase(HOST_CARD))
														  {
															  
														  trx_NCR.setTransaction_host_card(matcher.group(1));
														  }
													  
													     /*==========================================================================*\
														 |                               HOST   UTRNNO                               |
														 \*===========================================================================*/
													   
													   if (Io.toString().equalsIgnoreCase(HOST_UTRNNO))
														  {
														   trx_NCR.setUTRNNO(matcher.group(1));
														  }
													     /*==========================================================================*\
														 |                               HOST   AUTH                                 |
														 \*===========================================================================*/
													   
													   if (Io.toString().equalsIgnoreCase(HOST_AUTH))
														  {
														     trx_NCR.setTaransaction_AUTH(matcher.group(1));
														   
														   
														      line = br.readLine();
														      
														      Pattern patternInfos = Pattern.compile(HOST_INFO_TRANSACTION); 
															  Matcher matcherInfos = patternInfos.matcher(line); 
														     /*==========================================================================*\
															 |                               HOTS_INFO_TRANSACTION                       |
															 \*===========================================================================*/
														   
															  if (matcherInfos.find()) 
																 {
																  trx_NCR.setErrorTransaction(matcherInfos.group(1));
																 }
														   tService.saveTrasanction(trx_NCR);
														   trx_NCR=new Transaction();
														  }
													  
								  
								 }
							  
						}
						
					
					}
					}catch (IOException e) 
				    {
						e.printStackTrace();
					}  
			
			
		}
		
		return null;

	}

}
