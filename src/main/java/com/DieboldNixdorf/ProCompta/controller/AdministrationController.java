package com.DieboldNixdorf.ProCompta.controller;
 
 
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Properties;
import javax.servlet.http.HttpServletRequest;
import org.apache.commons.configuration.ConfigurationException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
 
 

 


@Controller

public class AdministrationController 
{
	
	
	@Value("${jrnMin}")
	String jrnMin;
	
	@Value("${jrnHour}")
	String jrnHour;
	
	@Value("${typeUploadJrn}")
	String typeUploadJrn;
	
	@Value("${typeUploadHost}")
	String typeUploadHost;
	
	
	@Value("${HostMin}")
	String HostMin;
	
	@Value("${HostHour}")
	String HostHour;
	
	
	
	

	@RequestMapping ("/config")
	public String GoAdministration (Model model) 
	{
		
		 model.addAttribute("typeUploadJrn",typeUploadJrn);
		 model.addAttribute("jrnHour",jrnHour);
		 model.addAttribute("jrnMin",jrnMin);
		 
		 model.addAttribute("typeUploadHost",typeUploadHost);
		 model.addAttribute("HostHour",HostHour);
		 model.addAttribute("HostMin",HostMin);
		 
		 String fixeTimeHost = null;
		 String fixeTimeJournalFile = null;
		 String reccurentTimeJournalMin = null;
	 
		 model.addAttribute("fixeTimeHost",fixeTimeHost);
		 model.addAttribute("fixeTimeJournalFile",fixeTimeJournalFile);
		 model.addAttribute("reccurentMinJournalFile",reccurentTimeJournalMin);
		 
		 
		return "appConfiguration";
	}
	
	
	
	@RequestMapping(value = "/hostFileParam", method = RequestMethod.POST)
    public String setParamUploadHostFile(HttpServletRequest request) throws ConfigurationException, IOException{ 
		    
		    String fixeTimeHost = request.getParameter("fixeTimeHost").toString();  
	        FileInputStream in = new FileInputStream(this.getClass().getResource("/Batch/batch.properties").getFile());
	        Properties props = new Properties();
	        props.load(in);
	        in.close();
	        FileOutputStream out = new FileOutputStream(this.getClass().getResource("/Batch/batch.properties").getFile());
	        
	        
	        if (!fixeTimeHost.equalsIgnoreCase("") ) 
	        {
	        	
	        	 
	        	String timeConvert = null;
	            String timeHour = null;
	            String timeMinute = null;
	             

	               SimpleDateFormat date12Format = new SimpleDateFormat("hh:mm a");

	               SimpleDateFormat date24Format = new SimpleDateFormat("HH:mm");

	               try {
	   				timeConvert =  date24Format.format(date12Format.parse(fixeTimeHost));
	   				
	   				String[] time = timeConvert.split ( ":" );
	   				timeHour =  time[0].trim();
	   				timeMinute = time[1].trim();
	   			} catch (ParseException e) {
	    
	   				e.printStackTrace();
	   			}
	            props.setProperty("typeUploadHost" , "fixedTime");
	           	props.setProperty("HostMin",  timeMinute);
	           	props.setProperty("HostHour", timeHour);   
		
	        } 
	        
	        props.store(out, null);
	        out.close();
	        return "appConfiguration"; 
	}
	
	
	
	@RequestMapping(value = "/journalFileParam", method = RequestMethod.POST)
    public String setParamJournalUpload(HttpServletRequest request  ) throws ConfigurationException, IOException{  
         
  
 
        String fixeTimeJournalFile = request.getParameter("fixeTimeJournalFile").toString();
        String reccurentTimeJournalMin = request.getParameter("reccurentTimeJournalMin");
     
       
        
        
        FileInputStream in = new FileInputStream(this.getClass().getResource("/Batch/batch.properties").getFile());
        Properties props = new Properties();
        props.load(in);
        in.close();
        FileOutputStream out = new FileOutputStream(this.getClass().getResource("/Batch/batch.properties").getFile());
        
        
        if (!reccurentTimeJournalMin.equalsIgnoreCase(""))	
        { 
        	props.setProperty("typeUploadJrn" , "recursive");
        	props.setProperty("jrnMin", "0/"+reccurentTimeJournalMin);
        	
        	props.setProperty("jrnHour", "*");
        		
        }
        if (!fixeTimeJournalFile.equalsIgnoreCase(""))
        {
        	
         String timeConvert = null;
         String timeHour = null;
         String timeMinute = null;
          

            SimpleDateFormat date12Format = new SimpleDateFormat("hh:mm a");

            SimpleDateFormat date24Format = new SimpleDateFormat("HH:mm");

            try {
				timeConvert =  date24Format.format(date12Format.parse(fixeTimeJournalFile));
				
				String[] time = timeConvert.split ( ":" );
				timeHour =  time[0].trim();
				timeMinute = time[1].trim();
			} catch (ParseException e) {
 
				e.printStackTrace();
			}
            props.setProperty("typeUploadJrn" , "fixedTime");
        	props.setProperty("jrnMin",  timeMinute);
        	props.setProperty("jrnHour", timeHour); 
        	 
        	
        	
        }
        
        props.store(out, null);
        out.close();

 
        return "appConfiguration";
    }
	

	 
}
