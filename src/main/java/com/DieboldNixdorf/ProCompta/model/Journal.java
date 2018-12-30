package com.DieboldNixdorf.ProCompta.model;

 
import java.sql.Time;
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
	   
	    @Column(name="datemodifjournal")
        private Time dateModifJournal;
	    
	    
	    @Column(name="traitementjournal")
	    private String handledJournal;
	    
	    
	    @Column(name="lignejournal")
	    private int ligneJournal;
	     
	    
	     

	    @ManyToOne( cascade = CascadeType.ALL)
	    @JoinColumn  (name="idAtm") 
	    private Atm atm;
	    
	    
	    @OneToMany(mappedBy = "journal", cascade = { CascadeType.PERSIST, CascadeType.DETACH, CascadeType.MERGE,
				CascadeType.REFRESH })
		private List<Transaction> transactions;
	    
	    @OneToMany(mappedBy = "journal", cascade = { CascadeType.PERSIST, CascadeType.DETACH, CascadeType.MERGE,
				CascadeType.REFRESH })
		private List<Incident> incidents;
	    
	    @OneToMany(mappedBy = "journal", cascade = { CascadeType.PERSIST, CascadeType.DETACH, CascadeType.MERGE,
				CascadeType.REFRESH })
		private List<Replenishment> replenishments;
	    
	    
	    @OneToMany(mappedBy = "journal", cascade = { CascadeType.PERSIST, CascadeType.DETACH, CascadeType.MERGE,
				CascadeType.REFRESH })
		private List<ErrorATM> errorsATM;
	    
	    
	    
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


		public Time getDateModifJournal() {
			return dateModifJournal;
		}

		public void setDateModifJournal(Time dateModifJournal) {
			this.dateModifJournal = dateModifJournal;
		}

		public String getHandledJournal() {
			return handledJournal;
		}

		public void setHandledJournal(String handledJournal) {
			this.handledJournal = handledJournal;
		}

		public int getLigneJournal() {
			return ligneJournal;
		}

		public void setLigneJournal(int ligneJournal) {
			this.ligneJournal = ligneJournal;
		}

		 

		public Atm getAtm() {
			return atm;
		}

		public void setAtm(Atm atm) {
			this.atm = atm;
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
