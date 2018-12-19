package com.DieboldNixdorf.ProCompta.tools;



 
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Locale;
 

 
 

public class ToolsToUse {
	
	
	
	  public Object[] appendValue(Object[] obj, Object newObj) 
	  {
		ArrayList<Object> temp = new ArrayList<Object>(Arrays.asList(obj));
		temp.add(newObj);
		return temp.toArray();
	  }
	  
	  
	  public Date convertStringToDatenew(String dateString) throws ParseException 
	  {
		 
		   
	       
	          DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	          Date date = new Date();
	          date = df.parse(dateString);
		      DateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
		      
	          
		  return date;
	  }
	  

	  
	  //DATE TO CONVERT FROM JAVA TO SQL ON THE CONTROLLERS 
	  
	  
	  public Date ConvertStringToDate(String dateString) throws ParseException {
		  
		    SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
	        Date parsed = format.parse(dateString);
	        java.sql.Date sql = new java.sql.Date(parsed.getTime());
		  
		  return sql;
	  }
	  
	  
	  public Time ConvertStringToTimeTrx(String timeString) throws ParseException
	  {
		   
		  
		  
          SimpleDateFormat format = new SimpleDateFormat("hh:mm aa");
		  
		  java.sql.Time timeValue = new java.sql.Time(format.parse(timeString).getTime());
		  System.out.println("    time ++++++++++++++++++++++++++++++++ "+timeValue);
		
		  return timeValue;
		  
		  
	 
		  
	  }
	  
	  
	  
	  
	  
	  
	  
	  
	  public Time ConevretStringToTime(String timeString) throws ParseException {
		  
		  SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
		  
		  java.sql.Time timeValue = new java.sql.Time(format.parse(timeString).getTime());
		
		  return timeValue;
		  
		  
	  }
	  
	  public Date ConvertStringHostToDate(String dateString) throws ParseException {
		  
		    SimpleDateFormat format = new SimpleDateFormat("dd/MM/yy");
	        Date parsed = format.parse(dateString);
	        java.sql.Date sql = new java.sql.Date(parsed.getTime());
	        
	        
		  
		  return sql;
	  }
	  
	  
	
	  @SuppressWarnings({ "rawtypes", "unchecked" })
	public ArrayList ConvertCashDispenseToCassette(String cashdisp) throws ParseException {
		  
		  ArrayList ret=new ArrayList();
		 
		  
		  String temp="";
		  for (int i=0;i<cashdisp.length();i++)
		  {
			  
			  if(!cashdisp.substring(i,i+1).equalsIgnoreCase(";"))
			  {
				  temp=temp+cashdisp.substring(i,i+1);
  
				  
			  }else {
				  ArrayList ll = new ArrayList();
				  ll.add(temp.substring(0,1));
				  ll.add(temp.substring(4,temp.length()));
				  ret.add(ll);
				  temp="";
			  }
			 
			  
		  }
		  
	        
	        
		  
		  return ret;
	  }
	  
	  
	  
	  
	

}
