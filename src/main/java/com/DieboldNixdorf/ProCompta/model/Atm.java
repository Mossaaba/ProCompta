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

	@Column(name = "typecnx")
	private String typeConnexion;

	@Column(name = "adresseip")
	private String AdressIp;

	@Column(name = "utilisateur")
	private String userSession;

	@Column(name = "motdepasse")
	private String passwordSession;

	@Column(name = "lettrelecteur")
	private String readingDisuqeLetter;

	@Column(name = "repertoire")
	private String repositoryFile;

	@Column(name = "nserie")
	private String NumeroSerie;

	public Atm() {

	}

	public Atm(int idAtm, String vendor, String nameAtm, String typeConnexion, String adressIp, String userSession,
			String passwordSession, String readingDisuqeLetter, String repositoryFile, String numeroSerie,
			List<Journal> atmJounals, Branch branch, Host host) {

		this.idAtm = idAtm;
		Vendor = vendor;
		this.nameAtm = nameAtm;
		this.typeConnexion = typeConnexion;
		AdressIp = adressIp;
		this.userSession = userSession;
		this.passwordSession = passwordSession;
		this.readingDisuqeLetter = readingDisuqeLetter;
		this.repositoryFile = repositoryFile;
		NumeroSerie = numeroSerie;
		AtmJounals = atmJounals;
		this.branch = branch;
		this.host = host;
	}

	@Transient
	@OneToMany(mappedBy = "atm", cascade = CascadeType.ALL)
	private List<Journal> AtmJounals;

	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH })
	@JoinColumn(name = "idBanque")
	private Branch branch;

	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH })
	@JoinColumn(name = "idConfiguration")
	private Host host;

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

	public Branch getBranch() {
		return branch;
	}

	public void setBranch(Branch branch) {
		this.branch = branch;
	}

	public Host getHost() {
		return host;
	}

	public void setHost(Host host) {
		this.host = host;
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

}
