package com.DieboldNixdorf.ProCompta.model;

import java.util.ArrayList;
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

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "atm")
public class Atm {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idAtm")
	private int idAtm;

	@Column(name = "idtypeatm")
	private String Vendor;

	@Column(name = "nomatm")
	private String nameAtm;

	@Column(name = "repertoire")
	private String repositoryFile;

	@Column(name = "nserie")
	private String NumeroSerie;

	public Atm() {

	}

	public Atm(int idAtm, String vendor, String nameAtm, String typeConnexion, String adressIp, String userSession,
			String passwordSession, String readingDisuqeLetter, String repositoryFile, String numeroSerie,
			List<Journal> atmJounals, Branch branch  ) {

		this.idAtm = idAtm;
		Vendor = vendor;
		this.nameAtm = nameAtm;
		 
 
		this.repositoryFile = repositoryFile;
		NumeroSerie = numeroSerie;
		AtmJounals = atmJounals;
		this.branch = branch;
		 
	}

    @Transient
	@JsonIgnore
	@OneToMany(mappedBy = "atm", cascade = CascadeType.ALL)
	private List<Journal> AtmJounals;
	
	@JsonIgnore
	@OneToMany(mappedBy = "atm", cascade = CascadeType.ALL)
	private List<FileUpload> AtmFileUpload;
	
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH })
	@JoinColumn(name = "idbranch")
	private Branch branch;

	
	 

	public List<Journal> getAtmJounals() {
		return AtmJounals;
	}

	public void setAtmJounals(List<Journal> atmJounals) {
		AtmJounals = atmJounals;
	}

	public int getIdAtm() {
		return idAtm;
	}

	public void setIdAtm(int idAtm) {
		this.idAtm = idAtm;
	}

	public String getVendor() {
		return Vendor;
	}

	public void setVendor(String vendor) {
		Vendor = vendor;
	}

	public String getNameAtm() {
		return nameAtm;
	}

	public void setNameAtm(String nameAtm) {
		this.nameAtm = nameAtm;
	}

	 

	 

	public String getRepositoryFile() {
		return repositoryFile;
	}

	public void setRepositoryFile(String repositoryFile) {
		this.repositoryFile = repositoryFile;
	}

	public Branch getBranch() {
		return branch;
	}

	public void setBranch(Branch branch) {
		this.branch = branch;
	}

	 

	public String getNumeroSerie() {
		return NumeroSerie;
	}

	public void setNumeroSerie(String numeroSerie) {
		NumeroSerie = numeroSerie;
	}

	public void addJournal(Journal journal) {

		if (AtmJounals == null) {
			AtmJounals = new ArrayList<>();
		}
		AtmJounals.add(journal);
	}
	
	
	public void addFile(FileUpload fileUpload) {

		if (AtmFileUpload == null) {
			AtmFileUpload = new ArrayList<>();
		}
		AtmFileUpload.add(fileUpload);
	}

}
