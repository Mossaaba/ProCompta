package com.DieboldNixdorf.ProCompta.model;

import java.sql.Time;
import java.util.Date;

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
@Table(name = "incidents")
public class Incident {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idincident")
	private int idIncident;

	@Column(name = "date_incident")
	private Date incident_date;  

	@Column(name = "time_incident")
	private Time incident_time;

	@Column(name = "details_incidents")
	private String detailsincidents;

	@Transient
	private int idAtm;
	
	
	@Transient  
	private String StartingDateFilterIncident; 
	@Transient
	private String FinishingDateFilterIncident;
	@Transient
	private String StartingTimeFilterIncident;
	@Transient 
	private String FinisingTimeFilterIncident;
	

	@JsonIgnore
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH })
	@JoinColumn(name = "idjournal")
	private Journal journal;

	public int getIdIncident() {
		return idIncident;
	}

	public void setIdIncident(int idIncident) {
		this.idIncident = idIncident;
	}

	public Date getIncident_date() {
		return incident_date;
	}

	public void setIncident_date(Date incident_date) {
		this.incident_date = incident_date;
	}

	public Time getIncident_time() {
		return incident_time;
	}

	public void setIncident_time(Time incident_time) {
		this.incident_time = incident_time;
	}

	public String getDetailsincidents() {
		return detailsincidents;
	}

	public void setDetailsincidents(String detailsincidents) {
		this.detailsincidents = detailsincidents;
	}

	public Journal getJournal() {
		return journal;
	}

	public void setJournal(Journal journal) {
		this.journal = journal;
	}

	public int getIdAtm() {
		return idAtm;
	}

	public void setIdAtm(int idAtm) {
		this.idAtm = idAtm;
	}

	public String getStartingDateFilterIncident() {
		return StartingDateFilterIncident;
	}

	public void setStartingDateFilterIncident(String startingDateFilterIncident) {
		StartingDateFilterIncident = startingDateFilterIncident;
	}

	public String getFinishingDateFilterIncident() {
		return FinishingDateFilterIncident;
	}

	public void setFinishingDateFilterIncident(String finishingDateFilterIncident) {
		FinishingDateFilterIncident = finishingDateFilterIncident;
	}

	public String getStartingTimeFilterIncident() {
		return StartingTimeFilterIncident;
	}

	public void setStartingTimeFilterIncident(String startingTimeFilterIncident) {
		StartingTimeFilterIncident = startingTimeFilterIncident;
	}

	public String getFinisingTimeFilterIncident() {
		return FinisingTimeFilterIncident;
	}

	public void setFinisingTimeFilterIncident(String finisingTimeFilterIncident) {
		FinisingTimeFilterIncident = finisingTimeFilterIncident;
	}

	 
	
	

}
