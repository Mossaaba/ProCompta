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
	private String startingDateFilterIncident;   
	@Transient
	private String finishingDateFilterIncident;
	@Transient
	private String startingTimeFilterIncident;
	@Transient 
	private String finisingTimeFilterIncident;
	

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
		return startingDateFilterIncident;
	}

	public void setStartingDateFilterIncident(String startingDateFilterIncident) {
		this.startingDateFilterIncident = startingDateFilterIncident;
	}

	public String getFinishingDateFilterIncident() {
		return finishingDateFilterIncident;
	}

	public void setFinishingDateFilterIncident(String finishingDateFilterIncident) {
		this.finishingDateFilterIncident = finishingDateFilterIncident;
	}

	public String getStartingTimeFilterIncident() {
		return startingTimeFilterIncident;
	}

	public void setStartingTimeFilterIncident(String startingTimeFilterIncident) {
		this.startingTimeFilterIncident = startingTimeFilterIncident;
	}

	public String getFinisingTimeFilterIncident() {
		return finisingTimeFilterIncident;
	}

	public void setFinisingTimeFilterIncident(String finisingTimeFilterIncident) {
		this.finisingTimeFilterIncident = finisingTimeFilterIncident;
	}

	 
	 
	
	

}
