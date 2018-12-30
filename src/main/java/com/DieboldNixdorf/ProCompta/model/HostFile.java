package com.DieboldNixdorf.ProCompta.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="host_file")
public class HostFile {
	
	
	    @Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	    @Column(name="id_host_file")
        private Integer idHostFile;	
	    
	    @Column(name="name_host_file")
	    private String NameHostFile;
	     
	    @Column(name="date_uploaded")
	    private Date DateUplaoded;
	     

		public Integer getIdHostFile() 
		{
			return idHostFile;
		}

		public void setIdHostFile(Integer idHostFile) {
			this.idHostFile = idHostFile;
		}

		public String getNameHostFile() {
			return NameHostFile;
		}

		public void setNameHostFile(String nameHostFile) {
			NameHostFile = nameHostFile;
		}

		public Date getDateUplaoded() {
			return DateUplaoded;
		}

		public void setDateUplaoded(Date dateUplaoded) {
			DateUplaoded = dateUplaoded;
		}
	    
	    
	    
	    
	    
	
	
	

}
