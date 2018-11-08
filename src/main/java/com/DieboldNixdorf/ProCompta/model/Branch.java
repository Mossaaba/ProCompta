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

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "banque")
public class Branch {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idbanque")
	private int idBranch;

	@Column(name = "codebanque")
	private String codeBranche;

	@Column(name = "nombanque")
	private String nomBranch;

	@Column(name = "telbanque")
	private String phoneBranch;

	@Column(name = "adressebanque")
	private String adressBranch;

	@Column(name = "nombrestation")
	private int nbrStation;

	@JsonIgnore
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH })
	@JoinColumn(name = "idbankref")
	private Bank bank;

	@JsonIgnore
	@OneToMany(mappedBy = "branch", cascade = { CascadeType.PERSIST, CascadeType.DETACH, CascadeType.MERGE,
			CascadeType.REFRESH })
	private List<Atm> atms;

	public List<Atm> getAtms() {
		return atms;
	}

	public void setAtms(List<Atm> atms) {
		this.atms = atms;
	}

	public Bank getBank() {
		return bank;
	}

	public void setBank(Bank bank) {
		this.bank = bank;
	}

	public Branch() {

	}

	public Branch(int idBranch, String codeBranche, String nomBranch, String phoneBranch, String adressBranch,
			int nbrStation, Bank bank, List<Atm> atms) {

		this.idBranch = idBranch;
		this.codeBranche = codeBranche;
		this.nomBranch = nomBranch;
		this.phoneBranch = phoneBranch;
		this.adressBranch = adressBranch;
		this.nbrStation = nbrStation;

	}

	public int getIdBranch() {
		return idBranch;
	}

	public void setIdBranch(int idBranch) {
		this.idBranch = idBranch;
	}

	public String getNomBranch() {
		return nomBranch;
	}

	public void setNomBranch(String nomBranch) {
		this.nomBranch = nomBranch;
	}

	public String getAdressBranch() {
		return adressBranch;
	}

	public void setAdressBranch(String adressBranch) {
		this.adressBranch = adressBranch;
	}

	public String getPhoneBranch() {
		return phoneBranch;
	}

	public void setPhoneBranch(String phoneBranch) {
		this.phoneBranch = phoneBranch;
	}

	public int getNbrStation() {
		return nbrStation;
	}

	public void setNbrStation(int nbrStation) {
		this.nbrStation = nbrStation;
	}

	public String getCodeBranche() {
		return codeBranche;
	}

	public void setCodeBranche(String codeBranche) {
		this.codeBranche = codeBranche;
	}

	public void addAtm(Atm atm) {

		if (atms == null) {
			atms = new ArrayList<>();
		}

		atms.add(atm);
	}
}
