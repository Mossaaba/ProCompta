package com.DieboldNixdorf.ProCompta.service;

import java.util.List;

import com.DieboldNixdorf.ProCompta.model.Journal;

public interface JounalService {

	List<Journal> findAll();

	Journal findById(int idjournal);

	void save(Journal journal);

	List<Journal> findAllByAtmId(int idAtm);

	void deleteById(int idjournal);

	void save(Journal journal, int idAtm);

}
