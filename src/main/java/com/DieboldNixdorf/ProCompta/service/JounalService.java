package com.DieboldNixdorf.ProCompta.service;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.DieboldNixdorf.ProCompta.model.Journal;

public interface JounalService {

	List<Journal> findAll();

	Journal findById(int idjournal);


	List<Journal> findAllByAtmId(int idAtm);

	void deleteById(int idjournal);
	
	void updateJournal (Journal journal);

	int saveJournal(Journal journal, int idAtm);
	
    boolean JounralExiste(String journalName);
    
    List<String> ParseJournal(MultipartFile multipartFile , int idAtm);
    
    void deleteByDate (String dateJournal);

}
