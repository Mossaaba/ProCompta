package com.DieboldNixdorf.ProCompta.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "reconciliation")
public class Reconciliation {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_reconciliation")
	private int idReconciliation;
	
	
	@Column(name = "id_trx")
	private int idTransaction;
	
	
	@Column(name = "id_trx_host")
	private int idTransactionHost; 
	
	
	@Column(name = "journal_file")
	private String jrnFile;
	
	
	@Column(name = "host_file")
	private String hostFile;
	

	@Column(name = "type_reconciliation")
	private String typeReconciliation;
	
	
	@Column(name = "date_reconciliation")
	private Date dateReconciliation;

	@Column(name = "comment")
	private String comment;
	
	
	

	public int getIdReconciliation() {
		return idReconciliation;
	}


	public void setIdReconciliation(int idReconciliation) {
		this.idReconciliation = idReconciliation;
	}


	public int getIdTransaction() {
		return idTransaction;
	}


	public void setIdTransaction(int idTransaction) {
		this.idTransaction = idTransaction;
	}


	public int getIdTransactionHost() {
		return idTransactionHost;
	}


	public void setIdTransactionHost(int idTransactionHost) {
		this.idTransactionHost = idTransactionHost;
	}


	public String getJrnFile() {
		return jrnFile;
	}


	public void setJrnFile(String jrnFile) {
		this.jrnFile = jrnFile;
	}


	public String getHostFile() {
		return hostFile;
	}


	public void setHostFile(String hostFile) {
		this.hostFile = hostFile;
	}


	public String getTypeReconciliation() {
		return typeReconciliation;
	}


	public void setTypeReconciliation(String typeReconciliation) {
		this.typeReconciliation = typeReconciliation;
	}


	public Date getDateReconciliation() {
		return dateReconciliation;
	}


	public void setDateReconciliation(Date dateReconciliation) {
		this.dateReconciliation = dateReconciliation;
	}


	public String getComment() {
		return comment;
	}


	public void setComment(String comment) {
		this.comment = comment;
	}
	
	
	
}
