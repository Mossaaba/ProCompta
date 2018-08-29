package com.DieboldNixdorf.ProCompta.model;

import java.sql.Time;

public class Incident {
	
	
	private int idIncident;
	private int idjournal;
	private String DebutIncidentDate;
	private String finIncidentDate;
	private String DateIncident;
	private Time heuredebutIncident;
	private Time heurefinIncident;
	private String detailsincidents ;
	
 
	public Incident(int idIncident, int idjournal, String debutIncidentDate, String finIncidentDate,
			String dateIncident, Time heuredebutIncident, Time heurefinIncident, String detailsincidents) {
	 
					this.idIncident = idIncident;
					this.idjournal = idjournal;
					DebutIncidentDate = debutIncidentDate;
					this.finIncidentDate = finIncidentDate;
					DateIncident = dateIncident;
					this.heuredebutIncident = heuredebutIncident;
					this.heurefinIncident = heurefinIncident;
					this.detailsincidents = "";
	}
	
	public Incident() {}
	
	
	
	public int getIdIncident() {
		return idIncident;
	}
	public void setIdIncident(int idIncident) {
		this.idIncident = idIncident;
	}
	public int getIdjournal() {
		return idjournal;
	}
	public void setIdjournal(int idjournal) {
		this.idjournal = idjournal;
	}
	public String getDebutIncidentDate() {
		return DebutIncidentDate;
	}
	public void setDebutIncidentDate(String debutIncidentDate) {
		DebutIncidentDate = debutIncidentDate;
	}
	public String getFinIncidentDate() {
		return finIncidentDate;
	}
	public void setFinIncidentDate(String finIncidentDate) {
		this.finIncidentDate = finIncidentDate;
	}
	public String getDateIncident() {
		return DateIncident;
	}
	public void setDateIncident(String dateIncident) {
		DateIncident = dateIncident;
	}
	public Time getHeuredebutIncident() {
		return heuredebutIncident;
	}
	public void setHeuredebutIncident(Time heuredebutIncident) {
		this.heuredebutIncident = heuredebutIncident;
	}
	public Time getHeurefinIncident() {
		return heurefinIncident;
	}
	public void setHeurefinIncident(Time heurefinIncident) {
		this.heurefinIncident = heurefinIncident;
	}
	public String getDetailsincidents() {
		return detailsincidents;
	}
	public void setDetailsincidents(String detailsincidents) {
		this.detailsincidents = detailsincidents;
	} 
	
	
	
	

}
