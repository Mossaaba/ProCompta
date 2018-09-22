package com.DieboldNixdorf.ProCompta.service;

import java.util.List;

import com.DieboldNixdorf.ProCompta.model.Bank;

public interface BankService {

	public List<Bank> getAllBanks();

	Bank findById(int idBank);

	void updateUser(Bank bank);

	void saveBank(Bank bank);

	void deleteBankById(int idBank);

	boolean isbankUnique(String abbreviation);

}
