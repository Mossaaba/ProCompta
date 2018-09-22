package com.DieboldNixdorf.ProCompta.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "bank")
public class Bank {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idbank")
	private int idBank;

	@Column(name = "nambank")
	private String namBank;

	@Column(name = "adressbank")
	private String adressBank;

	@Column(name = "phonebank")
	private String phoneBank;

	@Column(name = "logobank")
	private String logo;

	@Column(name = "colorbank")
	private String color;

	@Column(name = "binbank")
	private String bin;

	@Column(name = "abbreviation")
	private String abbreviation;

	@OneToMany(mappedBy = "bank", cascade = { CascadeType.PERSIST, CascadeType.DETACH, CascadeType.MERGE,
			CascadeType.REFRESH })
	private List<Branch> branche;

	public Bank() {

	}

	public Bank(String namBank, String adressBank, String phoneBank, String logo, String color, String bin,
			String abbreviation) {

		this.namBank = namBank;
		this.adressBank = adressBank;
		this.phoneBank = phoneBank;
		this.logo = logo;
		this.color = color;
		this.bin = bin;
		this.abbreviation = abbreviation;
	}

	public int getIdBank() {
		return idBank;
	}

	public void setIdBank(int idBank) {
		this.idBank = idBank;
	}

	public String getNamBank() {
		return namBank;
	}

	public void setNamBank(String namBank) {
		this.namBank = namBank;
	}

	public String getAdressBank() {
		return adressBank;
	}

	public void setAdressBank(String adressBank) {
		this.adressBank = adressBank;
	}

	public String getPhoneBank() {
		return phoneBank;
	}

	public void setPhoneBank(String phoneBank) {
		this.phoneBank = phoneBank;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getBin() {
		return bin;
	}

	public void setBin(String bin) {
		this.bin = bin;
	}

	public List<Branch> getBranches() {
		return branche;
	}

	public void setBranches(List<Branch> branche) {
		this.branche = branche;
	}

	public String getAbbreviation() {
		return abbreviation;
	}

	public void setAbbreviation(String abbreviation) {
		this.abbreviation = abbreviation;
	}

	public void add(Branch tempBranch) {

		if (branche == null) {
			branche = new ArrayList<>();
		}

		branche.add(tempBranch);
		tempBranch.setBank(this);
	}

}
