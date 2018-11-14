package com.DieboldNixdorf.ProCompta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.DieboldNixdorf.ProCompta.dao.JournalDao;
import com.DieboldNixdorf.ProCompta.model.Journal;

@Service("JournalService")
@Transactional
public class JournalServiceImpl implements JounalService {

	@Autowired
	JournalDao journalDao;

	@Override
	public List<Journal> findAll() {

		return journalDao.findAll();
	}

	@Override
	public Journal findById(int idjournal) {

		return journalDao.findById(idjournal);
	}

	@Override
	public void save(Journal journal) {
		journalDao.save(journal);

	}

	@Override
	public List<Journal> findAllByAtmId(int idAtm) {

		return journalDao.findAllByAtmId(idAtm);
	}

	@Override
	public void deleteById(int idjournal) {

		journalDao.deleteById(idjournal);

	}

	@Override
	public void save(Journal journal, int idAtm) {
		journalDao.save(journal, idAtm);

	}

}
