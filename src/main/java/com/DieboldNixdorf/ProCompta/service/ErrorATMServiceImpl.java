package com.DieboldNixdorf.ProCompta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.DieboldNixdorf.ProCompta.dao.ErrorATMDao;
import com.DieboldNixdorf.ProCompta.model.ErrorATM;


@Service
@Transactional
public class ErrorATMServiceImpl implements ErrorATMService {

	@Autowired
	private ErrorATMDao errorATMDao;

	@Override
	public ErrorATM findErrorATMById(Integer id) {
 
		return errorATMDao.findErrorATMById(id);
	}

	@Override
	public List<ErrorATM> findAllErrorsATM() {
 
		return errorATMDao.findAllErrorsATM();
	}

	@Override
	public void saveErrorATM(ErrorATM errorATM) {
		errorATMDao.saveErrorATM(errorATM);

	}

	@Override
	public void deleteErrorATM(ErrorATM rrrorATM) {
		errorATMDao.deleteErrorATM(rrrorATM);

	}

}
