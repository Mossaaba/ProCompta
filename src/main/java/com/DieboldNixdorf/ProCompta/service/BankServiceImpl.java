package com.DieboldNixdorf.ProCompta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.DieboldNixdorf.ProCompta.dao.BankDao;
import com.DieboldNixdorf.ProCompta.model.Bank;

@Service("bankService")
@Transactional
public class BankServiceImpl implements BankService {

	@Autowired
	private BankDao bankDao;

	@Override
	public Bank findById(int idBank) {
		return bankDao.findById(idBank);
	}

	@Override
	public void saveBank(Bank bank) {
		bankDao.saveBank(bank);
	}

	@Override
	public void deleteBankById(int idBank) {
		bankDao.deleteBankById(idBank);

	}

	@Override
	public List<Bank> getAllBanks() {
		return bankDao.getAllBanks();
	}

	@Override
	public void updateUser(Bank bank) {
		bankDao.saveBank(bank);
	}

	@Override
	public boolean isbankUnique(String abbreviation) {
		return bankDao.isbankUnique(abbreviation);
	}

}
