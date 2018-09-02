package com.DieboldNixdorf.ProCompta.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="atm")
public class Atm {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="idatm")
	private String idAtm;
	
	@Column(name="idbanque")
	private int idBanque;
	
	@Column(name="idconfiguration")
	private int idConfiguration;
	
	@Column(name="idtypeatm")
	private String Vendor ; 
	
	@Column(name="nomatm")
	private String nameAtm;
	
	@Column(name="typecnx")
	private String typeConnexion;
	
	@Column(name="adresseip")
	private String AdressIp;
	
	@Column(name="utilisateur")
	private String userSession;
	
	@Column(name="motdepasse")
	private String passwordSession;
	
	@Column(name="lettrelecteur")
	private String readingDisuqeLetter;
	
	@Column(name="repertoire")
	private String repositoryFile;

	public Atm() {
		 
	}

	public String getIdAtm() {
		return idAtm;
	}

	public void setIdAtm(String idAtm) {
		this.idAtm = idAtm;
	}

	public int getIdBanque() {
		return idBanque;
	}

	public void setIdBanque(int idBanque) {
		this.idBanque = idBanque;
	}

	public int getIdConfiguration() {
		return idConfiguration;
	}

	public void setIdConfiguration(int idConfiguration) {
		this.idConfiguration = idConfiguration;
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

	public String getTypeConnexion() {
		return typeConnexion;
	}

	public void setTypeConnexion(String typeConnexion) {
		this.typeConnexion = typeConnexion;
	}

	public String getAdressIp() {
		return AdressIp;
	}

	public void setAdressIp(String adressIp) {
		AdressIp = adressIp;
	}

	public String getUserSession() {
		return userSession;
	}

	public void setUserSession(String userSession) {
		this.userSession = userSession;
	}

	public String getPasswordSession() {
		return passwordSession;
	}

	public void setPasswordSession(String passwordSession) {
		this.passwordSession = passwordSession;
	}

	public String getReadingDisuqeLetter() {
		return readingDisuqeLetter;
	}

	public void setReadingDisuqeLetter(String readingDisuqeLetter) {
		this.readingDisuqeLetter = readingDisuqeLetter;
	}

	public String getRepositoryFile() {
		return repositoryFile;
	}

	public void setRepositoryFile(String repositoryFile) {
		this.repositoryFile = repositoryFile;
	}
	
	
	
	
	
	

}
