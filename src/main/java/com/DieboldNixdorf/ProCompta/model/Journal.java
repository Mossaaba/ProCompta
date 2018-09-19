package com.DieboldNixdorf.ProCompta.model;

import java.sql.Date;
import java.sql.Time;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
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
	     
	    
	    @Lob @Basic(fetch = FetchType.LAZY)
	    @Column(name="content")
	    private byte[] content;
	

	    @ManyToOne( cascade={CascadeType.DETACH, CascadeType.MERGE,
	    		    		CascadeType.PERSIST, CascadeType.REFRESH})
	    @JoinColumn  (name="idAtm") 
	    private Atm atm;
	    
	    
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

		public byte[] getContent() {
			return content;
		}

		public void setContent(byte[] content) {
			this.content = content;
		}

		public Atm getAtm() {
			return atm;
		}

		public void setAtm(Atm atm) {
			this.atm = atm;
		}
	

	

}
