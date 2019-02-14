package com.DieboldNixdorf.ProCompta.model;

import java.util.ArrayList;
import java.util.Date;
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
@Table(name="host_file")
public class HostFile {
	
	
	    @Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	    @Column(name="id_host_file")
        private Integer idHostFile;	
	                  
	    @Column(name="name_host_file")
	    private String nameHostFile;
	     
	    @Column(name="date_host_file")
	    private Date dateHostFile;
	    
	    @Column(name="time_upload_host_file")
        private String timeUploadHostFile;
	    
	    
	    @Column(name="date_upload_host_file")
        private String dateUplaodHostFile;
	     

	    @OneToMany(mappedBy = "hostFile", cascade = { CascadeType.PERSIST, CascadeType.DETACH, CascadeType.MERGE,
				CascadeType.REFRESH })
		private List<TransactionHost> transactionsHost;
	    
	    
	    
		public String getNameHostFile() {
			return nameHostFile;
		}

		public void setNameHostFile(String nameHostFile) {
			this.nameHostFile = nameHostFile;
		}

		public Integer getIdHostFile() 
		{
			return idHostFile;
		}

		public void setIdHostFile(Integer idHostFile) {
			this.idHostFile = idHostFile;
		}

		public String getDateUplaodHostFile() {
			return dateUplaodHostFile;
		}

		public void setDateUplaodHostFile(String dateUplaodHostFile) {
			this.dateUplaodHostFile = dateUplaodHostFile;
		}

		public Date getDateHostFile() {
			return dateHostFile;
		}

		public void setDateHostFile(Date dateHostFile) {
			this.dateHostFile = dateHostFile;
		}

		public String getTimeUploadHostFile() {
			return timeUploadHostFile;
		}

		public void setTimeUploadHostFile(String timeUploadHostFile) {
			this.timeUploadHostFile = timeUploadHostFile;
		}

		public void addTransactionHost(TransactionHost transactionHost) 
		{

			if (transactionsHost == null) {
				transactionsHost = new ArrayList<>();
			}
			transactionsHost.add(transactionHost);
		}
	    
	    
	
	
	

}
