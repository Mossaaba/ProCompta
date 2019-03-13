package com.DieboldNixdorf.ProCompta.service;

import java.util.List;

import com.DieboldNixdorf.ProCompta.model.Atm;

public interface AtmService {

	public List<Atm> listAtms();

	Atm findById(int idAtm);

	void save(Atm atm);

	void saveAtm(Atm atm,  int idBranch);

	void deleteById(int idAtm);

	public List<Atm> listAtmsByBranch(int idBranch);

}
