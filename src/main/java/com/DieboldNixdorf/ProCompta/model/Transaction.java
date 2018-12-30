package com.DieboldNixdorf.ProCompta.model;
import java.sql.Date;
import java.sql.Time;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

 
 

@Entity
@Table(name="transaction")
public class Transaction  {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idtransaction")
	private int idtransaction;
	
	@Column(name = "starting_date")
	private Date startingDate;
	
	@Column(name = "starting_time")
	private Time startingTime;
	
	@Column(name = "finishing_date")
	private Date finishingDate;
	
	@Column(name = "finishing_time")
	private Time finishingTime;
	
	@Column(name = "card_number")
	private String cardNumber;
	
	@Column(name = "amount_entred")
	private String amountEntred;
	
	@Column(name = "cash_request")
	private String cashRequest;
	
	@Column(name = "cash_dispensed")
	private String cashDispensed;
	
	@Column(name = "cash_presented")
	private boolean cashPresented;
	
	@Column(name = "cash_taken")
	private boolean cashTaken;   
	
	@Column(name = "card_taken")
	private boolean cardTaken;
	
	@Column(name = "type_transaction")
	private String transactionType;

	@Column(name = "transaction_date_host")
	private Date transactionDateHost;
	
	@Column(name = "transaction_host_time")
	private Time transactionHostTime;
	
	@Column(name = "transaction_host_amount")
	private Double transactionHostAmount;
	
	@Column(name = "transaction_host_atm")
	private String transactionHostATM;
	
	@Column(name = "utrnno")
	private String UTRNNO;
	
	@Column(name = "auth_number")
	private String taransaction_AUTH;
	
	@Column(name = "cassette1")
    private int cassette1;
	
	@Column(name = "cassette2")
	private int cassette2;
	
	@Column(name = "cassette3")
	private int cassette3;
	
	@Column(name = "cassette4")
	private int cassette4;
	
	@Column(name = "error_transaction")
	private String errorTransaction;
	
	@Column(name = "transaction_infos")
	private String infosTransaction;
	
	@Column(name="transaction_host_card")
	private String transactionHostCard;
	
	@Transient
	private String transactionCardPartOne;  
	@Transient
	private String transactionCardPartTwo;
	@Transient
	private String transactionDateStarting;
	@Transient
	private String transactionDateFinishing ;
	@Transient
	private String transactionTimeFinishing;
	@Transient
	private String transactionTimeStarting	;
	@Transient
	private String transactionVendor;
	@Transient
	private int transactionHostAmounttMin; 	
	@Transient
	private int transactionHostAmountMax;
	@Transient
	private String transactionCardStatus; 	
	@Transient
	private String transactionCashStatus;
	
	
	@JsonIgnore
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH })
	@JoinColumn(name = "idjournal")
	private Journal journal;
	

	public Time getStartingTime() {
		return startingTime;
	}
	public void setStartingTime(Time startingTime) {
		this.startingTime = startingTime;
	}
 
	public Double getTransactionHostAmount() {
		return transactionHostAmount;
	}
	public void setTransactionHostAmount(Double transactionHostAmount) {
		this.transactionHostAmount = transactionHostAmount;
	}
	public String getErrorTransaction() {
		return errorTransaction;
	}
	public void setErrorTransaction(String errorTransaction) {
		this.errorTransaction = errorTransaction;
	}
 
	public String getInfosTransaction() {
		return infosTransaction;
	}
	public void setInfosTransaction(String infosTransaction) {
		this.infosTransaction = infosTransaction;
	}
	public Journal getJournal() {
		return journal;
	}
	public void setJournal(Journal journal) {
		this.journal = journal;
	}
	
	public int getIdtransaction() {
		return idtransaction;
	}
	public void setIdtransaction(int idtransaction) {
		this.idtransaction = idtransaction;
	}
 
	public Date getStartingDate() {
		return startingDate;
	}
	public void setStartingDate(Date startingDate) {
		this.startingDate = startingDate;
	}
	public String getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}
	public String getAmountEntred() {
		return amountEntred;
	}
	public void setAmountEntred(String amountEntred) {
		this.amountEntred = amountEntred;
	}
	public String getCashRequest() {
		return cashRequest;
	}
	public void setCashRequest(String cashRequest) {
		this.cashRequest = cashRequest;
	}
	public String getCashDispensed() {
		return cashDispensed;
	}
	public void setCashDispensed(String cashDispensed) {
		this.cashDispensed = cashDispensed;
	}
	public boolean isCashPresented() {
		return cashPresented;
	}
	public void setCashPresented(boolean cashPresented) {
		this.cashPresented = cashPresented;
	}
	public boolean isCashTaken() {
		return cashTaken;
	}
	public void setCashTaken(boolean cashTaken) {
		this.cashTaken = cashTaken;
	}
	public boolean isCardTaken() {
		return cardTaken;
	}
	public void setCardTaken(boolean cardTaken) {
		this.cardTaken = cardTaken;
	}
	public Date getFinishingDate() {
		return finishingDate;
	}
	public void setFinishingDate(Date finishingDate) {
		this.finishingDate = finishingDate;
	}
	 
	public Date getTransactionDateHost() {
		return transactionDateHost;
	}
	public void setTransactionDateHost(java.util.Date date) {
		this.transactionDateHost = (Date) date;
	}
	public Time getTransactionHostTime() {
		return transactionHostTime;
	}
	public void setTransactionHostTime(Time transactionHostTime) {
		this.transactionHostTime = transactionHostTime;
	}
	public String getTransactionType() {
		return transactionType;
	}
	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}
	public String getUTRNNO() {
		return UTRNNO;
	}
	public void setUTRNNO(String uTRNNO) {
		UTRNNO = uTRNNO;
	}
	public String getTaransaction_AUTH() {
		return taransaction_AUTH;
	}
	public void setTaransaction_AUTH(String taransaction_AUTH) {
		this.taransaction_AUTH = taransaction_AUTH;
	}
	public int getCassette1() {
		return cassette1;
	}
	public void setCassette1(int cassette1) {
		this.cassette1 = cassette1;
	}
	public int getCassette2() {
		return cassette2;
	}
	public void setCassette2(int cassette2) {
		this.cassette2 = cassette2;
	}
	public int getCassette3() {
		return cassette3;
	}
	public void setCassette3(int cassette3) {
		this.cassette3 = cassette3;
	}
	public int getCassette4() {
		return cassette4;
	}
	public void setCassette4(int cassette4) {
		this.cassette4 = cassette4;
	}
 
	public Time getFinishingTime() {
		return finishingTime;
	}
	public void setFinishingTime(Time finishingTime) {
		this.finishingTime = finishingTime;
	}
	
	public String getTransactionDateFinishing() {
		return transactionDateFinishing;
	}
	public void setTransactionDateFinishing(String transactionDateFinishing) {
		this.transactionDateFinishing = transactionDateFinishing;
	}
	public String getTransactionDateStarting() {
		return transactionDateStarting;
	}
	public void setTransactionDateStarting(String transactionDateStarting) {
		this.transactionDateStarting = transactionDateStarting;
	}
	public String getTransactionTimeFinishing() {
		return transactionTimeFinishing;
	}
	public void setTransactionTimeFinishing(String transactionTimeFinishing) {
		this.transactionTimeFinishing = transactionTimeFinishing;
	}
	public String getTransactionTimeStarting() {
		return transactionTimeStarting;
	}
	public void setTransactionTimeStarting(String transactionTimeStarting) {
		this.transactionTimeStarting = transactionTimeStarting;
	}
	public int getTransactionHostAmounttMin() {
		return transactionHostAmounttMin;
	}
	public void setTransactionHostAmounttMin(int transactionHostAmounttMin) {
		this.transactionHostAmounttMin = transactionHostAmounttMin;
	}
	public int getTransactionHostAmountMax() {
		return transactionHostAmountMax;
	}
	public void setTransactionHostAmountMax(int transactionHostAmountMax) {
		this.transactionHostAmountMax = transactionHostAmountMax;
	}
	 
	public String getTransactionVendor() {
		return transactionVendor;
	}
	public void setTransactionVendor(String transactionVendor) {
		this.transactionVendor = transactionVendor;
	}
	public String getTransactionHostATM() {
		return transactionHostATM;
	}
	public void setTransactionHostATM(String transactionHostATM) {
		this.transactionHostATM = transactionHostATM;
	}
	public String getTransactionHostCard() {
		return transactionHostCard;
	}
	public void setTransactionHostCard(String transactionHostCard) {
		this.transactionHostCard = transactionHostCard;
	}
	public String getTransactionCardPartOne() {
		return transactionCardPartOne;
	}
	public void setTransactionCardPartOne(String transactionCardPartOne) {
		this.transactionCardPartOne = transactionCardPartOne;
	}
	public String getTransactionCardPartTwo() {
		return transactionCardPartTwo;
	}
	public void setTransactionCardPartTwo(String transactionCardPartTwo) {
		this.transactionCardPartTwo = transactionCardPartTwo;
	}
	
	public String getTransactionCardStatus() {
		return transactionCardStatus;
	}
	public void setTransactionCardStatus(String transactionCardStatus) {
		this.transactionCardStatus = transactionCardStatus;
	}
	
	public String getTransactionCashStatus() {
		return transactionCashStatus;
	}
	public void setTransactionCashStatus(String transactionCashStatus) {
		this.transactionCashStatus = transactionCashStatus;
	}
 
	
	
	
}
