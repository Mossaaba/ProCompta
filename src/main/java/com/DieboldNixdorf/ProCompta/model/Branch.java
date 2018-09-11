package com.DieboldNixdorf.ProCompta.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table (name="banque")
public class Branch {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="idbanque")
	private int idBranch ; 
	
	@Column(name="codebanque")
	private String codeBranche;
	
	@Column(name="nombanque")
	private String nomBranch ;
	
	@Column(name="telbanque")
	private String phoneBranch;
	
	@Column(name="adressebanque")
	private String adressBranch ;
	
	@Column(name="nombrestation")
	private int nbrStation ;
	
	
	@ManyToOne (cascade= {CascadeType.PERSIST , CascadeType.DETACH , CascadeType .MERGE , CascadeType.REFRESH})
	@JoinColumn  (name="idbankref") 
	private Bank bank;
	
	
	public Bank getBank() {
		return bank;
	}


	public void setBank(Bank bank) {
		this.bank = bank;
	}
	
	
	
	
	public Branch() {
 
	}
	
	
	public Branch(String nomBranch, String adressBranch, String phoneBranch, int nbrStation , String codeBranche) {
 
		this.nomBranch = nomBranch;
		this.adressBranch = adressBranch;
		this.phoneBranch = phoneBranch;
		this.nbrStation = nbrStation;
		this.codeBranche = codeBranche;
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
	
	
	
	

}
