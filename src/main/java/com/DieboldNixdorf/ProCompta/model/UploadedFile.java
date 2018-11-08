package com.DieboldNixdorf.ProCompta.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

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
	 
	 @Column(name="size")
     private Long size;

	 @Column(name="type_file")
     private String type;

 
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
}
