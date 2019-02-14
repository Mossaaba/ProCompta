package com.DieboldNixdorf.ProCompta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

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
	public List<Journal> findAllByAtmId(int idAtm) {

		return journalDao.findAllByAtmId(idAtm);
	}

	@Override
	public void deleteById(int idjournal) {

		journalDao.deleteById(idjournal);

	}

	@Override
	public boolean JounralExiste(String journalName) {
		return journalDao.JounralExiste(journalName);

	}

	@Override
	public List<String> ParseJournal(MultipartFile multipartFile, int idAtm) {

		return journalDao.ParseJournal(multipartFile, idAtm);
	}

	@Override
	public int saveJournal(Journal journal, int idAtm) {

		return journalDao.saveJournal(journal, idAtm);
	}

	@Override
	public void deleteByDate(String dateJournal) {
		journalDao.deleteByDate(dateJournal);

	}

	@Override
	public void updateJournal(Journal journal) {
		journalDao.updateJournal(journal);

	}

}
