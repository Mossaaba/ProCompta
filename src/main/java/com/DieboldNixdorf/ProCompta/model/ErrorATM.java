package com.DieboldNixdorf.ProCompta.model;

import java.sql.Time;
import java.sql.Date;

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
@Table(name="error_atm")
public class ErrorATM {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "iderror_atm")
	private int idErrorATM;
	
	
	@Column(name = "date_error_atm")
	private Date dateErrorATM;
	
	
	@Column(name = "time_error_atm")
	private Time timeErrorATM;
	
	
	@Column(name = "details_error_atm")
	private String detailErrorAtm;
	
	@Column(name = "code_error_atm")
	private String codeErrorAtm;
	
	
	@Transient
	private int idAtm;
	@Transient  
	private String startingDateFilterErrorATM;   
	@Transient  
	private String finishingDateFilterErrorATM;
	@Transient
	private String startingTimeFilterErrorATM;
	@Transient 
	private String finisingTimeFilterErrorATM;
	
	
	
	
	
	@JsonIgnore
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH })
	@JoinColumn(name = "idjournal")
	private Journal journal;


	public int getIdErrorATM() {
		return idErrorATM;
	}


	public void setIdErrorATM(int idErrorATM) {
		this.idErrorATM = idErrorATM;
	}


	public Date getDateErrorATM() {
		return dateErrorATM;
	}


	public void setDateErrorATM(Date dateErrorATM) {
		this.dateErrorATM = dateErrorATM;
	}


	public Time getTimeErrorATM() {
		return timeErrorATM;
	}


	public void setTimeErrorATM(Time timeErrorATM) {
		this.timeErrorATM = timeErrorATM;
	}


	public String getDetailErrorAtm() {
		return detailErrorAtm;
	}


	public void setDetailErrorAtm(String detailErrorAtm) {
		this.detailErrorAtm = detailErrorAtm;
	}


	public Journal getJournal() {
		return journal;
	}


	public void setJournal(Journal journal) {
		this.journal = journal;
	}


	public String getCodeErrorAtm() {
		return codeErrorAtm;
	}


	public void setCodeErrorAtm(String codeErrorAtm) {
		this.codeErrorAtm = codeErrorAtm;
	}


	 


	public String getStartingDateFilterErrorATM() {
		return startingDateFilterErrorATM;
	}


	public void setStartingDateFilterErrorATM(String startingDateFilterErrorATM) {
		this.startingDateFilterErrorATM = startingDateFilterErrorATM;
	}


	public String getFinishingDateFilterErrorATM() {
		return finishingDateFilterErrorATM;
	}


	public void setFinishingDateFilterErrorATM(String finishingDateFilterErrorATM) {
		this.finishingDateFilterErrorATM = finishingDateFilterErrorATM;
	}


	public String getStartingTimeFilterErrorATM() {
		return startingTimeFilterErrorATM;
	}


	public void setStartingTimeFilterErrorATM(String startingTimeFilterErrorATM) {
		this.startingTimeFilterErrorATM = startingTimeFilterErrorATM;
	}


	public String getFinisingTimeFilterErrorATM() {
		return finisingTimeFilterErrorATM;
	}


	public void setFinisingTimeFilterErrorATM(String finisingTimeFilterErrorATM) {
		this.finisingTimeFilterErrorATM = finisingTimeFilterErrorATM;
	}


	public int getIdAtm() {
		return idAtm;
	}


	public void setIdAtm(int idAtm) {
		this.idAtm = idAtm;
	}
	
	
	
	
 
	
	
	
	

}
