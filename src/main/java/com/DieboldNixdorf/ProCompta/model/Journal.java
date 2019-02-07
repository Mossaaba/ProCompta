package com.DieboldNixdorf.ProCompta.model;

 
 
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

 
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
 
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
 
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="journal")
public class Journal {
	
	    @Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	    @Column(name="idjournal")
        private Integer idjournal;	
	
	    @Column(name="nomjournal")
	    private String nomJournal;
	     
	    @Column(name="datejournal")
	    private Date dateJournal;
	   
	    @Column(name="time_upload_journal")
        private String timeUploadJournal;
	     
	     

	    @ManyToOne( cascade = {CascadeType.PERSIST, CascadeType.DETACH, CascadeType.MERGE,
				CascadeType.REFRESH })
	    @JoinColumn  (name="idAtm") 
	    private Atm atm;
	    
	    
	    @OneToMany(mappedBy = "journal", cascade = { CascadeType.PERSIST, CascadeType.DETACH, CascadeType.MERGE,
				CascadeType.REFRESH , CascadeType.REMOVE } , orphanRemoval = true)
		private List<Transaction> transactions;
	    
	    @OneToMany(mappedBy = "journal", cascade = { CascadeType.PERSIST, CascadeType.DETACH, CascadeType.MERGE,
				CascadeType.REFRESH , CascadeType.REMOVE}, orphanRemoval = true)
		private List<Incident> incidents;
	    
	    @OneToMany(mappedBy = "journal", cascade = { CascadeType.PERSIST, CascadeType.DETACH, CascadeType.MERGE,
				CascadeType.REFRESH , CascadeType.REMOVE}, orphanRemoval = true)
		private List<Replenishment> replenishments;
	    
	    
	    @OneToMany(mappedBy = "journal", cascade = { CascadeType.PERSIST, CascadeType.DETACH, CascadeType.MERGE,
				CascadeType.REFRESH , CascadeType.REMOVE}, orphanRemoval = true)
		private List<ErrorATM> errorsATM;
	    
	    
	    
	    
	    @Column(name="nbr_transactios")
	    private int nbrTransactions;
	    @Column(name="nbr_replenishements")
	    private int nbrReplenishements;
	    @Column(name="nbr_incidents")
	    private int nbrIncidents;
	    @Column(name="nbr_errors_atm")
	    private int nbrErrorsATM;
	    
	    
	    
	    public Journal() {
	    	
	    	
	    }
	    
	    
		public Integer getIdjournal() {
			return idjournal;
		}

		public void setIdjournal(Integer idjournal) {
			this.idjournal = idjournal;
		}

		public String getNomJournal() {
			return nomJournal;
		}

		public void setNomJournal(String nomJournal) {
			this.nomJournal = nomJournal;
		}
		
		public Date getDateJournal() {
			return dateJournal;
		}

		public void setDateJournal(Date dateJournal) {
			this.dateJournal = dateJournal;
		}
 

		public String getTimeUploadJournal() {
			return timeUploadJournal;
		}


		public void setTimeUploadJournal(String timeUploadJournal) {
			this.timeUploadJournal = timeUploadJournal;
		}
		 
		public Atm getAtm() {
			return atm;
		}

		public void setAtm(Atm atm) {
			this.atm = atm;
		}
	
		
		
		public int getNbrTransactions() {
			return nbrTransactions;
		}


		public void setNbrTransactions(int nbrTransactions) {
			this.nbrTransactions = nbrTransactions;
		}


		public int getNbrReplenishements() {
			return nbrReplenishements;
		}


		public void setNbrReplenishements(int nbrReplenishements) {
			this.nbrReplenishements = nbrReplenishements;
		}


		public int getNbrIncidents() {
			return nbrIncidents;
		}


		public void setNbrIncidents(int nbrIncidents) {
			this.nbrIncidents = nbrIncidents;
		}


		public int getNbrErrorsATM() {
			return nbrErrorsATM;
		}


		public void setNbrErrorsATM(int nbrErrorsATM) {
			this.nbrErrorsATM = nbrErrorsATM;
		}


		public void addTransaction(Transaction transaction) 
		{

			if (transactions == null) {
				transactions = new ArrayList<>();
			}
			transactions.add(transaction);
		}
		
		public void addIncident(Incident incident) 
		{

			if (incidents == null) {
				incidents = new ArrayList<>();
			}
			incidents.add(incident);
		}
		
		public void addReplenishment(Replenishment replenishment) 
		{

			if (replenishments == null) {
				replenishments = new ArrayList<>();
			}
			replenishments.add(replenishment);
		}
		
		
		public void adderrorATM(ErrorATM errorATM) 
		{

			if (errorsATM == null) {
				errorsATM = new ArrayList<>();
			}
			errorsATM.add(errorATM);
		}
		
		
		

}
