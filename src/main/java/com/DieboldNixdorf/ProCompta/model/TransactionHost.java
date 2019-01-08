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
@Table(name="transaction_host")
public class TransactionHost {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idtransaction_host")
	private Integer idTransactionHost;
	
	@Column(name = "transaction_date")
	private Date transactionHostDate;
	
	@Column(name = "transaction_time")
	private Time transactionHostTime;
	
	@Column(name = "transaction_amount")
	private String transactionHostAmount;
	
	@Column(name = "transaction_authorization")
	private String transactionHostAuthorization;
	
	@Column(name = "transaction_type")
	private int transactionHostType;

	@Column(name = "transaction_bank_acquire")
	private String transactionBankAcquire;
	
	@Column(name = "transaction_branch_acquire")
	private String transactionBranchAcquire;   
	
	@Column(name = "transaction_card_number")
	private String transactionHostCradNumber;

	@Column(name="flag_trx")
	private String flagTransaction;
	
 
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH })
	@JoinColumn(name = "id_host_file")
	private HostFile hostFile;
	
	public HostFile getHostFile() {
		return hostFile;
	}

	public void setHostFile(HostFile hostFile) {
		this.hostFile = hostFile;
	}

	 

	public Integer getIdTransactionHost() {
		return idTransactionHost;
	}

	public void setIdTransactionHost(Integer idTransactionHost) {
		this.idTransactionHost = idTransactionHost;
	}

	public Date getTransactionHostDate() {
		return transactionHostDate;
	}

	public void setTransactionHostDate(Date transactionHostDate) {
		this.transactionHostDate = transactionHostDate;
	}

	public Time getTransactionHostTime() {
		return transactionHostTime;
	}

	public void setTransactionHostTime(Time transactionHostTime) {
		this.transactionHostTime = transactionHostTime;
	}
	
	public String getTransactionHostAmount() {
		return transactionHostAmount;
	}

	public void setTransactionHostAmount(String transactionHostAmount) {
		this.transactionHostAmount = transactionHostAmount;
	}

	public String getTransactionHostAuthorization() {
		return transactionHostAuthorization;
	}

	public void setTransactionHostAuthorization(String transactionHostAuthorization) {
		this.transactionHostAuthorization = transactionHostAuthorization;
	}

	public int getTransactionHostType() {
		return transactionHostType;
	}

	public void setTransactionHostType(int transactionHostType) {
		this.transactionHostType = transactionHostType;
	}

	public String getTransactionBankAcquire() {
		return transactionBankAcquire;
	}

	public void setTransactionBankAcquire(String transactionBankAcquire) {
		this.transactionBankAcquire = transactionBankAcquire;
	}

	public String getTransactionBranchAcquire() {
		return transactionBranchAcquire;
	}

	public void setTransactionBranchAcquire(String transactionBranchAcquire) {
		this.transactionBranchAcquire = transactionBranchAcquire;
	}

	public String getTransactionHostCradNumber() {
		return transactionHostCradNumber;
	}

	public void setTransactionHostCradNumber(String transactionHostCradNumber) {
		this.transactionHostCradNumber = transactionHostCradNumber;
	}

	public String getFlagTransaction() {
		return flagTransaction;
	}

	public void setFlagTransaction(String flagTransaction) {
		this.flagTransaction = flagTransaction;
	}
}
