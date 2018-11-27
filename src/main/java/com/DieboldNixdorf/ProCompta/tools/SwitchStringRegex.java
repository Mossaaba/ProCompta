package com.DieboldNixdorf.ProCompta.tools;

import java.util.ArrayList;
 

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;
  
@Component
  @PropertySource({"classpath:/regeX/regeX.properties"})
  
public class SwitchStringRegex {
	
     public static  String TRANSACTION_START;
     @Value("${TRANSACTION_START}")
     public static void setTRANSACTION_START(String tRANSACTION_START) {
 		TRANSACTION_START = tRANSACTION_START;
 	}
 
     public static final String PROTOCOL = "${TRANSACTION_START}";
	
	@Value("${CARD_NUMBER}")
	private String CARD_NUMBER;

	
	@Value("${OP_CODE_BUFFER}")
	private String OP_CODE_BUFFER;

	@Value("${PIN_ENTERED}")
	private String PIN_ENTERED;

	@Value("${AMOUNT_ENTERED}")
	private String AMOUNT_ENTERED;

	@Value("${CARD_TAKEN}")
	private String CARD_TAKEN;

	@Value("${CASH_REQUEST}")
	private String CASH_REQUEST;

	@Value("${CASH_DISPENSED}")
	private String CASH_DISPENSED;

	@Value("${CASH_PRESENTED}")
	private String CASH_PRESENTED;

	@Value("${CASH_TAKEN}")
	private String CASH_TAKEN;

	@Value("${CASH_RETRACTED}")
	private String CASH_RETRACTED;

	@Value("${COMMUNICATION_ERROR}")
	private String COMMUNICATION_ERROR;

	@Value("${CASH_PRESENT_TIMER_EXPIRED}")
	private String CASH_PRESENT_TIMER_EXPIRED;

	@Value("${WRONG_PIN_ENTERED}")
	private String WRONG_PIN_ENTERED;

	@Value("${CARD_EJECT_TIMER_EXPIRED}")
	private String CARD_EJECT_TIMER_EXPIRED;

	@Value("${RETAIN_CARD_NOT_SUPPORTED}")
	private String RETAIN_CARD_NOT_SUPPORTED;

	@Value("${ERROR_DURING_CASH_RETRACT}")
	private String ERROR_DURING_CASH_RETRACT;

	@Value("${CARD_RETAINED_BY_HOST}")
	private String CARD_RETAINED_BY_HOST;

	@Value("${CASH_RETRACT_CALLED_IN_ADRS}")
	private String CASH_RETRACT_CALLED_IN_ADRS;

	@Value("${TRANSACTION_END}")
	private String TRANSACTION_END;

	 
	
	
 
	
	public ArrayList<String> collectionTransaction = new ArrayList<String>();
	public ArrayList<String> Incident = new ArrayList<String>();
	public ArrayList<String> Error = new ArrayList<String>();
	public ArrayList<String> Replinishement = new ArrayList<String>();
	
	
	public SwitchStringRegex() {
		 
	}
	
	
	
	 
	
	
	 
	 
	
	
	
	

}
