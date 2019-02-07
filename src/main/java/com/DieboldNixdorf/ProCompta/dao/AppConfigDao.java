package com.DieboldNixdorf.ProCompta.dao;

import com.DieboldNixdorf.ProCompta.model.ProComptaConfig;

public interface AppConfigDao {
	
	
	ProComptaConfig findById(int idConfig);

	void save(ProComptaConfig proComptaConfig);

}
