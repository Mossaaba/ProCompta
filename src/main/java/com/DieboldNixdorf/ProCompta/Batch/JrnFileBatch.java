package com.DieboldNixdorf.ProCompta.Batch;

import java.io.File;
 
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.io.FilenameUtils;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
 
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
 
 
import com.DieboldNixdorf.ProCompta.model.Atm;
import com.DieboldNixdorf.ProCompta.model.UploadedFile;
import com.DieboldNixdorf.ProCompta.service.AppConfigService;
import com.DieboldNixdorf.ProCompta.service.AtmService;
import com.DieboldNixdorf.ProCompta.service.FileUploadService;
import com.DieboldNixdorf.ProCompta.service.JounalService;
import com.DieboldNixdorf.ProCompta.tools.ToolsToUse;

import org.springframework.mock.web.MockMultipartFile;

 


@PropertySource({ "classpath:/Batch/batch.properties" })
@Component
public class JrnFileBatch {
	
	
	@Value("${jrnMin}")
	String jrnMin;
	@Value("${jrnHour}")
	String jrnHour;
	@Value("${typeUpload}")
	String typeUpload;
 
	@Autowired 
	AtmService atmService;
	
	@Autowired 
	JounalService jounalService;
	
	@Autowired
	private FileUploadService uploadService;
	
    @Autowired 
    private AppConfigService appConfigService;
	 
    
    
	
@Scheduled(cron = "0 ${jrnMin} ${jrnHour} * * *")

	public void scheduleTaskUsingCronExpression() throws IOException 
{

	
 
	
	
	       long now = System.currentTimeMillis() / 1000;
	       System.out.println( "ProCompta schedule tasks using cron jobs Reading Jrn File - " + now); 
	    
	   
           DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		  java.util.Date date = new java.util.Date();
		  ToolsToUse tls = new ToolsToUse();
		
		
	 
		jounalService.deleteByDate(dateFormat.format(date));
			
			
	    
	    
	    List<Atm> atmList = atmService.listAtms();
	    for(Atm atm : atmList) 
	    {

	    	
            System.out.println(" Path "+atm.getRepositoryFile() );
            File folder = new File(atm.getRepositoryFile());
            File[] listOfFiles = folder.listFiles();
            String journalFileName = "";
            String fileNameWithOutExt= "";
            for (int i = 0; i < listOfFiles.length; i++) {
	            	  if (listOfFiles[i].isFile()) 
	            	  {
	            		   
	            		    journalFileName = listOfFiles[i].getName();
	            		    
	            		    if (atm.getVendor().equalsIgnoreCase("NCR")) 
	            		    {
            	        		
	            		    	fileNameWithOutExt = FilenameUtils.removeExtension(journalFileName);
	            				
	            				
	            				   Pattern patternJournalNCR = Pattern.compile("(NCR\\W\\w+)_([0-2][0-9][0-9][0-9][0-1][0-9][0-3][0-9])\\d+_EJDATA"); 
	            				   Matcher MathcerJournalNCR = patternJournalNCR.matcher(fileNameWithOutExt);
	            				   if (MathcerJournalNCR.find()) 
	            				   {
	            					   
	            					   fileNameWithOutExt =  MathcerJournalNCR.group(1)+"_"+MathcerJournalNCR.group(2) ;
	            					   
	            				   }
            	        		
            	        		
            	        	}
	            		    else 
	            		    {
	            		    	
	            		    	
	            		    	fileNameWithOutExt = FilenameUtils.removeExtension(journalFileName);
	            		    	
	            		    	
	            		    }
	            		    
	            	       
	            	        boolean ExisteJournal = jounalService.JounralExiste(fileNameWithOutExt); 
	            	        
	            	       
	            	        if (!ExisteJournal) 
	                        {
	            	        	
	            	        	
	            	        	 
	            	        	    File file = new File(atm.getRepositoryFile()+"/"+journalFileName);
	            	        	    String name = journalFileName;
	            	        	    String originalFileName = journalFileName;
	            	        	    String contentType = "text/plain";
	            	        	    Path pathjrn = Paths.get(atm.getRepositoryFile()+"/"+journalFileName);
	            	        	    byte[] content = null;
	            	        	    try {
	            	        	        content = Files.readAllBytes(pathjrn);
	            	        	    } catch (final IOException e) {
	            	        	    }
	            	        	    MultipartFile multipartFile = new MockMultipartFile(name, originalFileName, contentType, content); 
	            	        	    List<String> listeSingleResultParsing= jounalService.ParseJournal(multipartFile, atm.getIdAtm());
	            	        	    saveFileToLocalDisk(multipartFile);
	            	                UploadedFile fileInfo = getUploadedFileInfo(multipartFile);
	            	                fileInfo = saveFileToDatabase(fileInfo);
	            	     			  
	            	                
	            	           
	            	                
	            	               
	            	        	
	                        }
	            	        else 
	            	        {
	            	        	
	            	        	System.out.println("Journal Existe ");
	            	        	
	            	        }
	            	    
	            	  }  
            	}
            
	    	
	    	
	    	}
	    
	    
	}


    //-------------------------- Copy file to disk ----------------------------------------------------------------\\
	private void saveFileToLocalDisk(MultipartFile multipartFile) throws IOException, FileNotFoundException {

		String outputFileName = getOutputFilename(multipartFile );

		FileCopyUtils.copy(multipartFile.getBytes(), new FileOutputStream(outputFileName));
	}
	//-------------------------- Save File to date base  ------------------------------------------------------------\\
	private UploadedFile saveFileToDatabase(UploadedFile uploadedFile) {

		return uploadService.saveFile(uploadedFile);

	}
	//-------------------------- Save File to date base  -------------------------------------------------------------\\
	private String getOutputFilename(MultipartFile multipartFile) {

		return getDestinationLocation() + multipartFile.getOriginalFilename() + ".Done";
	}
	//-------------------------- Save File to date base  --------------------------------------------------------------\\
	private UploadedFile getUploadedFileInfo(MultipartFile multipartFile) throws IOException 
	{

		UploadedFile fileInfo = new UploadedFile();
		fileInfo.setName(multipartFile.getOriginalFilename());
		fileInfo.setSize(multipartFile.getSize());
		fileInfo.setType(multipartFile.getContentType());
		fileInfo.setLocation(getDestinationLocation());

		return fileInfo;
	}
	//-------------------------- Location saved journal repository   ----------------------------------------------------\\
	private String getDestinationLocation()
	{
		return "C:/myProComptaTemp/";
	}
	
 
  
	
	
	
}
