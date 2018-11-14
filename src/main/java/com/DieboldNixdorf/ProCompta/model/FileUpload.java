package com.DieboldNixdorf.ProCompta.model;

import java.sql.Date;

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
@Table(name="uploaded_file")
public class FileUpload {
	
	@Id 
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id_file")
	private Integer idFile; 
	
	@Column(name="nom_uploadedfile")
	private String nameFile;
	
	@Column(name="date_upload")
	private Date fileDateUploaded;
	
	@Column(name="type_file")
	private String typeFile;

	 
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.DETACH, CascadeType.MERGE, CascadeType.REFRESH })
	@JoinColumn(name = "idAtm")
	private Atm atm;
	
	
	public Atm getAtm() {
		return atm;
	}

	public void setAtm(Atm atm) {
		this.atm = atm;
	}

	public int getIdFile() {
		return idFile;
	}

	public void setIdFile(int idFile) {
		this.idFile = idFile;
	}

	public String getNameFile() {
		return nameFile;
	}

	public void setNameFile(String nameFile) {
		this.nameFile = nameFile;
	}

	public Date getFileDateUploaded() {
		return fileDateUploaded;
	}

	public void setFileDateUploaded(Date fileDateUploaded) {
		this.fileDateUploaded = fileDateUploaded;
	}

	public String getTypeFile() {
		return typeFile;
	}

	public void setTypeFile(String typeFile) {
		this.typeFile = typeFile;
	}
	
	
	public FileUpload () {}

	public FileUpload(int idFile, String nameFile, Date fileDateUploaded, String typeFile) {
	 
		this.idFile = idFile;
		this.nameFile = nameFile;
		this.fileDateUploaded = fileDateUploaded;
		this.typeFile = typeFile;
	}
}
