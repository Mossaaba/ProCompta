package com.DieboldNixdorf.ProCompta.tools;



import java.util.ArrayList;
import java.util.Arrays;

public class ToolsToUse {
	
	
	
	  public Object[] appendValue(Object[] obj, Object newObj) 
	  {
		ArrayList<Object> temp = new ArrayList<Object>(Arrays.asList(obj));
		temp.add(newObj);
		return temp.toArray();
	  }

	  
	  //DATE TO CONVERT FROM JAVA TO SQL ON THE CONTROLLERS 
	  
	  
	  
	  
	
	
	

}
