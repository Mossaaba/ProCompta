package com.DieboldNixdorf.ProCompta.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.DieboldNixdorf.ProCompta.dao.AppConfigDao;
import com.DieboldNixdorf.ProCompta.model.ProComptaConfig;

@Service
@Transactional

public class AppConfigServiceImpl implements AppConfigService {

	
	@Autowired
	private AppConfigDao appConfigDao;
	
	
	
	@Override
	public ProComptaConfig findById(int idConfig) {
	 
		return appConfigDao.findById(idConfig);
	}

	@Override
	public void save(ProComptaConfig proComptaConfig) {
		appConfigDao.save(proComptaConfig);

	}

}
