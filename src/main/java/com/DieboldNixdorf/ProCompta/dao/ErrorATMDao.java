package com.DieboldNixdorf.ProCompta.dao;

import java.util.List;

import com.DieboldNixdorf.ProCompta.model.Atm;
import com.DieboldNixdorf.ProCompta.model.ErrorATM;
 
 

public interface ErrorATMDao {
	
	ErrorATM findErrorATMById(Integer id);
	List<ErrorATM> findAllErrorsATM();
	void saveErrorATM(ErrorATM errorATM);
	void deleteErrorATM(ErrorATM rrrorATM);
	List<Atm> find_All_ATM_DIEBOLD_NIXDORF();
	List<ErrorATM> typeOfErrorATM();
	List<ErrorATM> listErrorsAfterFiltring(ErrorATM err);
	
	

}
