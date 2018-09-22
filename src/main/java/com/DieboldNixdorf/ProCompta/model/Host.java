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
@Table(name = "configurationhost")
public class Host {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idconfiguration")
	private int idHost;

	@Column(name = "nomconfiguration")
	private String nomHost;

	@Column(name = "cassette01")
	private int configCassette1;

	@Column(name = "cassette02")
	private int configCassette2;

	@Column(name = "cassette03")
	private int configCassette3;

	@Column(name = "cassette04")
	private int configCassette4;

	@OneToMany(mappedBy = "host", cascade = { CascadeType.PERSIST, CascadeType.DETACH, CascadeType.MERGE,
			CascadeType.REFRESH })
	private List<Atm> atms;

	public List<Atm> getAtms() {
		return atms;
	}

	public void setAtms(List<Atm> atms) {
		this.atms = atms;
	}

	public Host() {

	}

	public Host(String nomHost, int configCassette1, int configCassette2, int configCassette3, int configCassette4) {

		this.nomHost = nomHost;
		this.configCassette1 = configCassette1;
		this.configCassette2 = configCassette2;
		this.configCassette3 = configCassette3;
		this.configCassette4 = configCassette4;
	}

	public int getIdHost() {
		return idHost;
	}

	public void setIdHost(int idHost) {
		this.idHost = idHost;
	}

	public String getNomHost() {
		return nomHost;
	}

	public void setNomHost(String nomHost) {
		this.nomHost = nomHost;
	}

	public int getConfigCassette1() {
		return configCassette1;
	}

	public void setConfigCassette1(int configCassette1) {
		this.configCassette1 = configCassette1;
	}

	public int getConfigCassette2() {
		return configCassette2;
	}

	public void setConfigCassette2(int configCassette2) {
		this.configCassette2 = configCassette2;
	}

	public int getConfigCassette3() {
		return configCassette3;
	}

	public void setConfigCassette3(int configCassette3) {
		this.configCassette3 = configCassette3;
	}

	public int getConfigCassette4() {
		return configCassette4;
	}

	public void setConfigCassette4(int configCassette4) {
		this.configCassette4 = configCassette4;
	}

	public void addAtm(Atm atm) {

		if (atms == null) {
			atms = new ArrayList<>();
		}
		atms.add(atm);
	}

}
