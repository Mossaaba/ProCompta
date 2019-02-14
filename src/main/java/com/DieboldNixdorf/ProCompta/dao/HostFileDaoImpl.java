package com.DieboldNixdorf.ProCompta.dao;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.commons.io.FilenameUtils;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import com.DieboldNixdorf.ProCompta.model.HostFile;
import com.DieboldNixdorf.ProCompta.model.TransactionHost;
import com.DieboldNixdorf.ProCompta.service.HostFileService;
import com.DieboldNixdorf.ProCompta.service.TransactionHostService;
import com.DieboldNixdorf.ProCompta.tools.ToolsToUse;

@Repository
@PropertySource({ "classpath:/regeX/HostInfosPositions.properties" })
public class HostFileDaoImpl extends AbstractDao<Integer, HostFile> implements HostFileDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Autowired
	private HostFileService hostFileService;
	
	
	@Autowired
	private TransactionHostService trxHostService;

	
	@Value("${Host_CardNumber_start_postion}")
	int cardNumberStart;
	
	@Value("${Host_CardNumber_end_postion}")
	int cardNumberEnd;
	
	@Value("${Host_BankAcquireBin_start_postion}")
	int bankAcquireBinStart;
	
	@Value("${Host_BankAcquireBin_end_postion}")
	int bankAcquireBinEnd;
	
	@Value("${Host_BranchAcquireName_start_position}") 
	int branchAcquireStart;
	
	@Value("${Host_BranchAcquireName_end_position}")
	int branchAcquireEnd;
	
	@Value("${Host_DateTrx_start_position}")
	int dateTransactionStart;
	
	@Value("${Host_DateTrx_end_position}")
	int dateTransactionEnd;

	@Value("${Host_TimeTrx_start_position}")
	int timeTransactionStart;
	
	@Value("${Host_TimeTrx_end_position}")
	int timeTransactionEnd;
	
	@Value("${Host_TypeTrx_start_position}")
	int typeTransactionStart;
	
	@Value("${Host_TypeTrx_end_position}")
	int typeTransactionEnd;
		
	@Value("${Host_AmountTrx_start_position}")
	int amountTransactionStart;
	
	@Value("${Host_AmountTrx_end_position}")
	int amountTransactionEnd;
	
	@Value("${Host_AuthorisationTrx_start_position}")
	int authorisationTransactionStart;
	
	@Value("${Host_AuthorisationTrx_end_position}")
	int authorisationTransactionEnd;
	
	
	
	
	
	
	
	
	
	
	@SuppressWarnings("unchecked")
	@Override
	public List<HostFile> findAll() {

		Criteria crit = createEntityCriteria();
		return (List<HostFile>) crit.list();
	}

	@Override
	public HostFile findById(int idHostFile) {
		return getByKey(idHostFile);
	}

	@Override
	public int saveHostFile(HostFile hostFile) {
		Session currentSession = sessionFactory.getCurrentSession();
		Integer idHostFile = (Integer) currentSession.save(hostFile);
		return idHostFile;
	}

	@Override
	public void deleteById(int idHostFile) {
		HostFile hostFile = getByKey(idHostFile);
		delete(hostFile);

	}

	@Override
	public boolean HostFileExiste(String NameHostFile) {
		Session currentSession = sessionFactory.getCurrentSession();

		@SuppressWarnings("rawtypes")
		Query theQuery = currentSession.createQuery("from HostFile where nameHostFile=:theNameOfTheHostFile",
				HostFile.class);
		theQuery.setParameter("theNameOfTheHostFile", NameHostFile);
		if (theQuery.uniqueResult() != null) {

			return true;
		} else {

			return false;
		}
	}

	@Override
	public List<String> ParseHostFile(MultipartFile multipartFile) 
	{
		
		

		@SuppressWarnings("unused")
		Session currentSession = sessionFactory.getCurrentSession();
		
		
	 
		HostFile hostFile = new HostFile();
		String HostFilelName = FilenameUtils.removeExtension(multipartFile.getOriginalFilename());
		ToolsToUse toolsProCompta = new ToolsToUse();

		Pattern pattern = Pattern.compile("TP(\\d+).*");
		Matcher matcher = pattern.matcher(HostFilelName);
		if (matcher.find()) {

			System.out.println("Date Host file +++++++++++++++++++++ " + matcher.group(1));

		}
		try 
		{
         hostFile.setDateHostFile(toolsProCompta.convertStringToDateFileHost(matcher.group(1)));
		} catch (ParseException e2)
		{
			e2.printStackTrace();
		}

		
		 
		hostFile.setNameHostFile(HostFilelName);
		String timeNow = new  SimpleDateFormat("HH:mm:SS").format(new java.util.Date());
		hostFile.setTimeUploadHostFile(timeNow);
		
		
		String dateNow = new SimpleDateFormat("YYYY:MM:dd").format(new java.util.Date());
		hostFile.setDateUplaodHostFile(dateNow);

		@SuppressWarnings("unused")
		int idhostFile = hostFileService.saveHostFile(hostFile);

		
		
		
		InputStreamReader isr = null;
		try {
			isr = new InputStreamReader(multipartFile.getInputStream(), StandardCharsets.UTF_8);
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		BufferedReader br = new BufferedReader(isr);
      
		String line;
		
		
		@SuppressWarnings("unused")
		int cpt;
		
		try {
			while ((line = br.readLine()) != null) 
			{
				TransactionHost trxHost = new TransactionHost();
				try {
					trxHost.setTransactionHostDate((java.sql.Date) toolsProCompta.ConvertStringToDate(line.substring(dateTransactionStart, dateTransactionEnd)));
					trxHost.setTransactionHostTime(toolsProCompta.ConevretStringToTimeFromTheHostFile(line.substring(timeTransactionStart, timeTransactionEnd))) ;
					
				    } catch (ParseException e) {
					 e.printStackTrace();
				    }
				 
				  
				
					trxHost.setTransactionHostAmount((line.substring(amountTransactionStart,amountTransactionEnd)).replaceAll("^0+", ""));
					trxHost.setTransactionHostAuthorization((line.substring(authorisationTransactionStart,authorisationTransactionEnd)).replaceAll("^0+", ""));
					trxHost.setTransactionHostType(Integer.parseInt(line.substring(typeTransactionStart, typeTransactionEnd)));
				    trxHost.setTransactionBankAcquire(line.substring(bankAcquireBinStart, bankAcquireBinEnd));
				    trxHost.setTransactionBranchAcquire(line.substring(branchAcquireStart, branchAcquireEnd));
				    trxHost.setTransactionHostCradNumber(line.substring(cardNumberStart, cardNumberEnd));
			        trxHost.setHostFile(hostFile);
			        
			        
			       cpt= trxHostService.saveTransaction(trxHost);
			
			}
		} catch (IOException e) {
			e.printStackTrace();
		}  
		
		
		return null;
	}

}
