package com.DieboldNixdorf.ProCompta.service;

import java.util.List;

import com.DieboldNixdorf.ProCompta.model.ErrorATM;

public interface ErrorATMService {
	
	ErrorATM findErrorATMById(Integer id);
	List<ErrorATM> findAllErrorsATM();
	void saveErrorATM(ErrorATM errorATM);
	void deleteErrorATM(ErrorATM rrrorATM);

}
