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
	     
	    @Column(name="date_uploaded")
	    private Date DateUplaoded;
	     

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

		 

		public Date getDateUplaoded() {
			return DateUplaoded;
		}

		public void setDateUplaoded(Date dateUplaoded) {
			DateUplaoded = dateUplaoded;
		}
	    
	    
		public void addTransactionHost(TransactionHost transactionHost) 
		{

			if (transactionsHost == null) {
				transactionsHost = new ArrayList<>();
			}
			transactionsHost.add(transactionHost);
		}
	    
	    
	
	
	

}
