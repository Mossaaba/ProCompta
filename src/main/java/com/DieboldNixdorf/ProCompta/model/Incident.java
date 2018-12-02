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

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="incidents")
public class Incident 
{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idincident")
	private int idIncident;
	
	@Column(name = "date_incident")
    private Date incident_date;
	
	@Column(name = "time_incident")
    private Time incident_time;
	
	@Column(name = "details_incidents")
	private String detailsincidents ;
	
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
	

}
