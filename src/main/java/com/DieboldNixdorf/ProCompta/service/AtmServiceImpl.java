package com.DieboldNixdorf.ProCompta.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.DieboldNixdorf.ProCompta.dao.AtmDao;
import com.DieboldNixdorf.ProCompta.model.Atm;

@Service("atmService")
@Transactional
public class AtmServiceImpl implements AtmService {

	@Autowired
	private AtmDao atmDao;

	@Override
	@Transactional
	public List<Atm> listAtms() {

		return atmDao.listAtms();
	}

	@Override
	public Atm findById(int idAtm) {
		return atmDao.findById(idAtm);
	}

	@Override
	public void save(Atm atm) {
		atmDao.save(atm);
	}

	@Override
	public void deleteById(int idAtm) {
		atmDao.deleteById(idAtm);
	}

	@Override
	public void saveAtm(Atm atm,  int idBranch) {
		atmDao.saveAtm(atm,  idBranch);

	}

	@Override
	public List<Atm> listAtmsByBranch(int idBranch) {
		// TODO Auto-generated method stub
		return atmDao.listAtmsByBranch(idBranch);
	}

}
