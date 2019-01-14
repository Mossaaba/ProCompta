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
@Table(name="replenishment")
public class Replenishment {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idreplenishment")
	private int idReplenishment;
	
	@Column(name="date_replenishment")
	private Date dateReplenishment;
	
	@Column(name="time_replenishment")
	private Time timeReplenishment;
	
	@Column(name="cassette_one_befor")
	private int cassetteOneBefor;
	
	@Column(name="cassette_two_befor")
	private int cassetteTwoBefor;

	@Column(name="cassette_three_befor")
	private int cassetteThreeBefor;
	
	@Column(name="cassette_four_befor")
	private int cassetteFourBefor;
	
	@Column(name="cassette_one_value_befor")
	private int cassetteOneValueBefor;
	
	@Column(name="cassette_two_value_befor")
	private int cassetteTwoValueBefor;

	@Column(name="cassette_three_value_befor")
	private int cassetteThreeValueBefor;
	
	@Column(name="cassette_four_value_befor")
	private int cassetteFourValueBefor;
	
	@Column(name="cassette_reject_befor")
	private int cassetteRejectBefor;
	
	@Column(name="cassette_retract_befor")
	private int cassetteRetractBefor;
	
	@Column(name="cassette_one_after")
	private int cassetteOneAfter;
	
	@Column(name="cassette_two_after")
	private int cassetteTwoAfter;

	@Column(name="cassette_three_after")
	private int cassetteThreeAfter;
	
	@Column(name="cassette_four_after")
	private int cassetteFourAfter;
	
	
	@Column(name="cassette_one_value_after")
	private int cassetteOneValueAfter;
	
	@Column(name="cassette_two_value_after")
	private int cassetteTwoValueAfter;

	@Column(name="cassette_three_value_after")
	private int cassetteThreeValueAfter;
	
	@Column(name="cassette_four_value_after")
	private int cassetteFourValueAfter;
	
	
	@Column(name="cassette_reject_after")
	private int cassetteRejectAfter;
	
	@Column(name="cassette_retract_after")
	private int cassetteRetractAfter;
	
	@Transient  
	private String startingDateFilterReplenishment; 
	@Transient
	private String finishingDateFilterReplenishment;
	@Transient
	private String startingTimeFilterReplenishment;
	@Transient 
	private String finisingTimeFilterReplenishment;
	@Transient 
	private int idAtm;
	
	
	
	
	@JsonIgnore
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH })
	@JoinColumn(name = "idjournal")
	private Journal journal;


	public int getIdReplenishment() {
		return idReplenishment;
	}


	public void setIdReplenishment(int idReplenishment) {
		this.idReplenishment = idReplenishment;
	}


	public Date getDateReplenishment() {
		return dateReplenishment;
	}


	public void setDateReplenishment(Date dateReplenishment) {
		this.dateReplenishment = dateReplenishment;
	}


	 

	public Time getTimeReplenishment() {
		return timeReplenishment;
	}


	public void setTimeReplenishment(Time timeReplenishment) {
		this.timeReplenishment = timeReplenishment;
	}


	public int getCassetteOneBefor() {
		return cassetteOneBefor;
	}


	public void setCassetteOneBefor(int cassetteOneBefor) {
		this.cassetteOneBefor = cassetteOneBefor;
	}


	public int getCassetteTwoBefor() {
		return cassetteTwoBefor;
	}


	public void setCassetteTwoBefor(int cassetteTwoBefor) {
		this.cassetteTwoBefor = cassetteTwoBefor;
	}


	public int getCassetteThreeBefor() {
		return cassetteThreeBefor;
	}


	public void setCassetteThreeBefor(int cassetteThreeBefor) {
		this.cassetteThreeBefor = cassetteThreeBefor;
	}


	public int getCassetteFourBefor() {
		return cassetteFourBefor;
	}


	public void setCassetteFourBefor(int cassetteFourBefor) {
		this.cassetteFourBefor = cassetteFourBefor;
	}


	public int getCassetteRejectBefor() {
		return cassetteRejectBefor;
	}


	public void setCassetteRejectBefor(int cassetteRejectBefor) {
		this.cassetteRejectBefor = cassetteRejectBefor;
	}


	public int getCassetteRetractBefor() {
		return cassetteRetractBefor;
	}


	public void setCassetteRetractBefor(int cassetteRetractBefor) {
		this.cassetteRetractBefor = cassetteRetractBefor;
	}


	public int getCassetteOneAfter() {
		return cassetteOneAfter;
	}


	public void setCassetteOneAfter(int cassetteOneAfter) {
		this.cassetteOneAfter = cassetteOneAfter;
	}


	public int getCassetteTwoAfter() {
		return cassetteTwoAfter;
	}


	public void setCassetteTwoAfter(int cassetteTwoAfter) {
		this.cassetteTwoAfter = cassetteTwoAfter;
	}


	public int getCassetteThreeAfter() {
		return cassetteThreeAfter;
	}


	public void setCassetteThreeAfter(int cassetteThreeAfter) {
		this.cassetteThreeAfter = cassetteThreeAfter;
	}


	public int getCassetteFourAfter() {
		return cassetteFourAfter;
	}


	public void setCassetteFourAfter(int cassetteFourAfter) {
		this.cassetteFourAfter = cassetteFourAfter;
	}


	public int getCassetteRejectAfter() {
		return cassetteRejectAfter;
	}


	public void setCassetteRejectAfter(int cassetteRejectAfter) {
		this.cassetteRejectAfter = cassetteRejectAfter;
	}


	public int getCassetteRetractAfter() {
		return cassetteRetractAfter;
	}


	public void setCassetteRetractAfter(int cassetteRetractAfter) {
		this.cassetteRetractAfter = cassetteRetractAfter;
	}


	public Journal getJournal() {
		return journal;
	}


	public void setJournal(Journal journal) {
		this.journal = journal;
	}
	
	
	public int getCassetteOneValueBefor() {
		return cassetteOneValueBefor;
	}


	public void setCassetteOneValueBefor(int cassetteOneValueBefor) {
		this.cassetteOneValueBefor = cassetteOneValueBefor;
	}


	public int getCassetteTwoValueBefor() {
		return cassetteTwoValueBefor;
	}


	public void setCassetteTwoValueBefor(int cassetteTwoValueBefor) {
		this.cassetteTwoValueBefor = cassetteTwoValueBefor;
	}


	public int getCassetteThreeValueBefor() {
		return cassetteThreeValueBefor;
	}


	public void setCassetteThreeValueBefor(int cassetteThreeValueBefor) {
		this.cassetteThreeValueBefor = cassetteThreeValueBefor;
	}


	public int getCassetteFourValueBefor() {
		return cassetteFourValueBefor;
	}


	public void setCassetteFourValueBefor(int cassetteFourValueBefor) {
		this.cassetteFourValueBefor = cassetteFourValueBefor;
	}


	public int getCassetteOneValueAfter() {
		return cassetteOneValueAfter;
	}


	public void setCassetteOneValueAfter(int cassetteOneValueAfter) {
		this.cassetteOneValueAfter = cassetteOneValueAfter;
	}


	public int getCassetteTwoValueAfter() {
		return cassetteTwoValueAfter;
	}


	public void setCassetteTwoValueAfter(int cassetteTwoValueAfter) {
		this.cassetteTwoValueAfter = cassetteTwoValueAfter;
	}


	public int getCassetteThreeValueAfter() {
		return cassetteThreeValueAfter;
	}


	public void setCassetteThreeValueAfter(int cassetteThreeValueAfter) {
		this.cassetteThreeValueAfter = cassetteThreeValueAfter;
	}


	public int getCassetteFourValueAfter() {
		return cassetteFourValueAfter;
	}


	public void setCassetteFourValueAfter(int cassetteFourValueAfter) {
		this.cassetteFourValueAfter = cassetteFourValueAfter;
	}


	 

	public String getStartingDateFilterReplenishment() {
		return startingDateFilterReplenishment;
	}


	public void setStartingDateFilterReplenishment(String startingDateFilterReplenishment) {
		this.startingDateFilterReplenishment = startingDateFilterReplenishment;
	}


	public String getFinishingDateFilterReplenishment() {
		return finishingDateFilterReplenishment;
	}


	public void setFinishingDateFilterReplenishment(String finishingDateFilterReplenishment) {
		this.finishingDateFilterReplenishment = finishingDateFilterReplenishment;
	}


	public String getStartingTimeFilterReplenishment() {
		return startingTimeFilterReplenishment;
	}


	public void setStartingTimeFilterReplenishment(String startingTimeFilterReplenishment) {
		this.startingTimeFilterReplenishment = startingTimeFilterReplenishment;
	}


	public String getFinisingTimeFilterReplenishment() {
		return finisingTimeFilterReplenishment;
	}


	public void setFinisingTimeFilterReplenishment(String finisingTimeFilterReplenishment) {
		this.finisingTimeFilterReplenishment = finisingTimeFilterReplenishment;
	}


	public int getIdAtm() {
		return idAtm;
	}


	public void setIdAtm(int idAtm) {
		this.idAtm = idAtm;
	}

	
	
}
