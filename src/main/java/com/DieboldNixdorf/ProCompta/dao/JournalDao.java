package com.DieboldNixdorf.ProCompta.dao;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.DieboldNixdorf.ProCompta.model.Journal;

public interface JournalDao {
	
	List<Journal> findAll();
    
	Journal findById(int idjournal);
     
	int saveJournal(Journal journal, int idAtm);
     
    List<Journal> findAllByAtmId(int idAtm);
     
    void deleteById(int idjournal);
    
    void updateJournal (Journal journal);
	
    boolean JounralExiste(String journalName);
    
    List<String> ParseJournal(MultipartFile multipartFile , int idAtm );
    
    void deleteByDate (String dateJournal);
    

}
  