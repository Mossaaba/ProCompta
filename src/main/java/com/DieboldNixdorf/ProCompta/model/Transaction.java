package com.DieboldNixdorf.ProCompta.model;
import java.io.Serializable;
import java.sql.Time;

 
 

 
public class Transaction implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private int idtransaction;
	private int idjournal;
	private String DebuttransactionDate;
	private String fintransactionDate;
	private String dateTransaction;
	private Time heuredebut;
	private Time heurefin;
	private String numerocarte;
	private String etatcarte;
	private long montant;
	private String etatcash;
	private String remarque;
	private String nauthorisation;
	private int cassette1;
	private int cassette2;
	private int cassette3;
	private int cassette4;
	private long montantMin; 
	private long montantMax ;
	
	public int getIdtransaction() {
		return idtransaction;
	}
	public void setIdtransaction(int idtransaction) {
		this.idtransaction = idtransaction;
	}
	public int getIdjournal() {
		return idjournal;
	}
	public void setIdjournal(int idjournal) {
		this.idjournal = idjournal;
	}
	public String getDebuttransactionDate() {
		return DebuttransactionDate;
	}
	public void setDebuttransactionDate(String debuttransactionDate) {
		DebuttransactionDate = debuttransactionDate;
	}
	public String getFintransactionDate() {
		return fintransactionDate;
	}
	public void setFintransactionDate(String fintransactionDate) {
		this.fintransactionDate = fintransactionDate;
	}
	public String getDateTransaction() {
		return dateTransaction;
	}
	public void setDateTransaction(String dateTransaction) {
		this.dateTransaction = dateTransaction;
	}
	public Time getHeuredebut() {
		return heuredebut;
	}
	public void setHeuredebut(Time heuredebut) {
		this.heuredebut = heuredebut;
	}
	public Time getHeurefin() {
		return heurefin;
	}
	public void setHeurefin(Time heurefin) {
		this.heurefin = heurefin;
	}
	public String getNumerocarte() {
		return numerocarte;
	}
	public void setNumerocarte(String numerocarte) {
		this.numerocarte = numerocarte;
	}
	public String getEtatcarte() {
		return etatcarte;
	}
	public void setEtatcarte(String etatcarte) {
		this.etatcarte = etatcarte;
	}
	 
	public String getEtatcash() {
		return etatcash;
	}
	public void setEtatcash(String etatcash) {
		this.etatcash = etatcash;
	}
	public String getRemarque() {
		return remarque;
	}
	public void setRemarque(String remarque) {
		this.remarque = remarque;
	}
	public String getNauthorisation() {
		return nauthorisation;
	}
	public void setNauthorisation(String nauthorisation) {
		this.nauthorisation = nauthorisation;
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
	 
	public long getMontantMin() {
		return montantMin;
	}
	public void setMontantMin(long montantMin) {
		this.montantMin = montantMin;
	}
	public long getMontantMax() {
		return montantMax;
	}
	public void setMontantMax(long montantMax) {
		this.montantMax = montantMax;
	}
	public Transaction() {
		 
	}
	public Long getMontant() {
		return montant;
	}
	public void setMontant(Long montant) {
		this.montant = montant;
	}
	
	
	public Transaction(int idtransaction, int idjournal, String debuttransactionDate, String fintransactionDate,
			String dateTransaction, Time heuredebut, Time heurefin, String numerocarte, String etatcarte,
			Long montant, String etatcash, String remarque, String nauthorisation, int cassette1, int cassette2,
			int cassette3, int cassette4, long montantMin, long montantMax ) {
	 
		this.idtransaction = idtransaction;
		this.idjournal = idjournal;
		this.DebuttransactionDate = debuttransactionDate;
		this.fintransactionDate = fintransactionDate;
		this.dateTransaction = dateTransaction;
		this.heuredebut = heuredebut;
		this.heurefin = heurefin;
		this.numerocarte = "";
		this.etatcarte = "";
		this.montant = (long) 0 ;
		this.etatcash = "";
		this.remarque = "";
		this.nauthorisation = "";
		this.cassette1 = 0;
		this.cassette2 = 0;
		this.cassette3 = 0;
		this.cassette4 = 0;
		this.montantMin = (long) 0;
		this.montantMax = (long) 0;
	 
		
	}
	 
 
	
	
	
	 
	 
}
