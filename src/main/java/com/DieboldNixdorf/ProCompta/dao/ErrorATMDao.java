package com.DieboldNixdorf.ProCompta.dao;

import java.util.List;

import com.DieboldNixdorf.ProCompta.model.ErrorATM;
 

public interface ErrorATMDao {
	
	ErrorATM findErrorATMById(Integer id);
	List<ErrorATM> findAllErrorsATM();
	void saveErrorATM(ErrorATM errorATM);
	void deleteErrorATM(ErrorATM rrrorATM);

}
