package com.DieboldNixdorf.ProCompta.dao;

import java.util.List;

import com.DieboldNixdorf.ProCompta.model.Atm;

public interface AtmDao {

	public List<Atm> listAtms();

	Atm findById(int idAtm);

	void save(Atm atm);

	void saveAtm(Atm atm, int idHost, int idBranch);

	void deleteById(int idAtm);
	
	public List<Atm> listAtmsByBranch(int idBranch);

}
