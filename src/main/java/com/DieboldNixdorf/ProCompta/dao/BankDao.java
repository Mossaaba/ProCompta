package com.DieboldNixdorf.ProCompta.dao;

import java.util.List;

import com.DieboldNixdorf.ProCompta.model.Bank;
 

public interface BankDao    
{

	public List<Bank> getAllBanks();
	
	Bank findById(int idBank);
	
	void saveBank(Bank bank);
	
	void deleteBankById(int idBank);
	
	boolean isbankUnique(String abbreviation);
	
	
	
}