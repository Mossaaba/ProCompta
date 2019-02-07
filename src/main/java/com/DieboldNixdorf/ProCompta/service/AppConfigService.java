package com.DieboldNixdorf.ProCompta.service;

import com.DieboldNixdorf.ProCompta.model.ProComptaConfig;

public interface AppConfigService {
	
	
	ProComptaConfig findById(int idConfig);

	void save(ProComptaConfig proComptaConfig);

}
