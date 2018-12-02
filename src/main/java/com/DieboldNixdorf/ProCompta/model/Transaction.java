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
	
	@Column(name = "finishing_date")
	private Date finishingDate;
	
	@Column(name = "type_transaction")
	private String transactionType;
	

	@Column(name = "transaction_date_host")
	private Date transactionDateHost;
	
	@Column(name = "transaction_host_time")
	private Time transactionHostTime;
	
	@Column(name = "transaction_host_amount")
	private Double transactionHostAmount;
	
	@Column(name = "transaction_host_branch")
	private String transactionHostBranch;
	
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
	private String transaction_host_card;
	
	
	
	
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
	public String getTransactionHostBranch() {
		return transactionHostBranch;
	}
	public void setTransactionHostBranch(String transactionHostBranch) {
		this.transactionHostBranch = transactionHostBranch;
	}
	public String getTransaction_host_card() {
		return transaction_host_card;
	}
	public void setTransaction_host_card(String transaction_host_card) {
		this.transaction_host_card = transaction_host_card;
	}
	
	public Time getFinishingTime() {
		return finishingTime;
	}
	public void setFinishingTime(Time finishingTime) {
		this.finishingTime = finishingTime;
	} 

	 
}
