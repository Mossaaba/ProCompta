package com.DieboldNixdorf.ProCompta.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "uploaded_file")
public class UploadedFile {

	  @Id 
	  @GeneratedValue(strategy=GenerationType.IDENTITY)
	  @Column(name="id_file")
      private Long id;
	 
	 @Column(name="nom_uploadedfile")
     private String name;
	 
	 @Column(name="location")
     private String location;
	 
	 @Column(name="date_upload")
	 private java.util.Date fileDateUploaded;
	 
	 @Column(name="size")
     private Long size;

	 @Column(name="type_file")
     private String type;
 
 
	 
	 @Transient
	 private int nbrTransactions;
	 @Transient
	 private int nbrReplenishements;
	 @Transient 
	 private int nbrIncidents;
	 @Transient 
	 private int nbrErrorsATM;
	 
	 
	
	 
  public Long getId() {
    return id;
  }

  
  public String getName() {
    return name;
  }

 
  public String getLocation() {
    return location;
  }

 
  public Long getSize() {
    return size;
  }

 
  public String getType() {
    return type;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public void setName(String name) {
    this.name = name;
  }

  public void setLocation(String location) {
    this.location = location;
  }

  public void setSize(Long size) {
    this.size = size;
  }

  public void setType(String type) {
    this.type = type;
  }


public int getNbrTransactions() {
	return nbrTransactions;
}


public void setNbrTransactions(int nbrTransactions) {
	this.nbrTransactions = nbrTransactions;
}


public int getNbrReplenishements() {
	return nbrReplenishements;
}


public void setNbrReplenishements(int nbrReplenishements) {
	this.nbrReplenishements = nbrReplenishements;
}


public int getNbrIncidents() {
	return nbrIncidents;
}


public void setNbrIncidents(int nbrIncidents) {
	this.nbrIncidents = nbrIncidents;
}


public int getNbrErrorsATM() {
	return nbrErrorsATM;
}


public void setNbrErrorsATM(int nbrErrorsATM) {
	this.nbrErrorsATM = nbrErrorsATM;
}


public java.util.Date getFileDateUploaded() {
	return fileDateUploaded;
}


public void setFileDateUploaded(java.util.Date fileDateUploaded) {
	this.fileDateUploaded = fileDateUploaded;
}

 

 
  











  
}
