package com.DieboldNixdorf.ProCompta.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.DieboldNixdorf.ProCompta.dao.RegexDao;
import com.DieboldNixdorf.ProCompta.model.RegeX;

@Service
@Transactional
public class RegeXserviceImpl implements RegeXService {

	@Autowired
	private RegexDao regexDao;

	@Override
	public List<RegeX> getAllRegeX() {

		return regexDao.getAllRegeX();
	}

	@Override
	public RegeX findById(int idRegeX) {
		return regexDao.findById(idRegeX);
	}

	@Override
	public void saveRegeX(RegeX regeX) {
		regexDao.saveRegeX(regeX);

	}

	@Override
	public void deleteRegeXById(int idRegeX) {
		regexDao.deleteRegeXById(idRegeX);

	}

}
