package com.DieboldNixdorf.ProCompta.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="regex")
public class RegeX {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "idregex")
	private int idRegeX; 
	
	@Column(name = "value")
	private String valueRegex;
	
	@Column(name = "name")
	private String nameRegex;
	
	@Column(name = "posx")
	private int index_X; 
	
	@Column(name = "posy")
	private int index_Y; 
	
	@Column(name = "details")
	private String detailsRegex;

	public RegeX () {}
	
	public RegeX(int idRegeX, String valueRegex, String nameRegex, int index_X, int index_Y, String detailsRegex) {
	 
		this.idRegeX = idRegeX;
		this.valueRegex = valueRegex;
		this.nameRegex = nameRegex;
		this.index_X = index_X;
		this.index_Y = index_Y;
		this.detailsRegex = detailsRegex;
	}

	public int getIdRegeX() {
		return idRegeX;
	}

	public void setIdRegeX(int idRegeX) {
		this.idRegeX = idRegeX;
	}

	public String getValueRegex() {
		return valueRegex;
	}

	public void setValueRegex(String valueRegex) {
		this.valueRegex = valueRegex;
	}

	public String getNameRegex() {
		return nameRegex;
	}

	public void setNameRegex(String nameRegex) {
		this.nameRegex = nameRegex;
	}

	public int getIndex_X() {
		return index_X;
	}

	public void setIndex_X(int index_X) {
		this.index_X = index_X;
	}

	public int getIndex_Y() {
		return index_Y;
	}

	public void setIndex_Y(int index_Y) {
		this.index_Y = index_Y;
	}

	public String getDetailsRegex() {
		return detailsRegex;
	}

	public void setDetailsRegex(String detailsRegex) {
		this.detailsRegex = detailsRegex;
	}
	
	
	
	
	
	

}
