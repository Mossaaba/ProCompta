package com.DieboldNixdorf.ProCompta.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="app_config")
public class ProComptaConfig {
	
	 @Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	 @Column(name="id_config")
     private Integer idConfig;  
   
	 @Column(name="type_uploading_journal_file")
	 private String  JournalFileUploadType;
	
	 @Column(name="journal_file_upload_time_minute")
	 private String JournalFileTimeMinute;
	 
	 @Column(name="journal_file_upload_time_hour")
	 private String JournalFileTimeHour;
	  
	 @Column(name="delay_journal_file")
	 private String JournalFileDelay;
	 
	 @Column(name="host_file_uplaod_time_hour")
	 private String HostFileTimeHour;
	
	 @Column(name="host_file_uplaod_time_Minute")
	 private String HostFileTimeMinute;
	 
	 @Column (name="host_file_path_folder")
	 private String hostFileFolderPath;

	 
	 
	public Integer getIdConfig() {
		return idConfig;
	}

	public void setIdConfig(Integer idConfig) {
		this.idConfig = idConfig;
	}

	public String getJournalFileUploadType() {
		return JournalFileUploadType;
	}

	public void setJournalFileUploadType(String journalFileUploadType) {
		JournalFileUploadType = journalFileUploadType;
	}

	public String getJournalFileTimeMinute() {
		return JournalFileTimeMinute;
	}

	public void setJournalFileTimeMinute(String journalFileTimeMinute) {
		JournalFileTimeMinute = journalFileTimeMinute;
	}

	public String getJournalFileTimeHour() {
		return JournalFileTimeHour;
	}

	public void setJournalFileTimeHour(String journalFileTimeHour) {
		JournalFileTimeHour = journalFileTimeHour;
	}

	public String getJournalFileDelay() {
		return JournalFileDelay;
	}

	public void setJournalFileDelay(String journalFileDelay) {
		JournalFileDelay = journalFileDelay;
	}

	public String getHostFileTimeHour() {
		return HostFileTimeHour;
	}

	public void setHostFileTimeHour(String hostFileTimeHour) {
		HostFileTimeHour = hostFileTimeHour;
	}

	public String getHostFileTimeMinute() {
		return HostFileTimeMinute;
	}

	public void setHostFileTimeMinute(String hostFileTimeMinute) {
		HostFileTimeMinute = hostFileTimeMinute;
	}

	public String getHostFileFolderPath() {
		return hostFileFolderPath;
	}

	public void setHostFileFolderPath(String hostFileFolderPath) {
		this.hostFileFolderPath = hostFileFolderPath;
	}
	
	 
	
	
	
	
	

}
