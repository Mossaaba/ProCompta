package com.DieboldNixdorf.ProCompta.service;

import java.util.List;

import com.DieboldNixdorf.ProCompta.model.Atm;
import com.DieboldNixdorf.ProCompta.model.Replenishment;

public interface ReplenishmentService {
	
	Replenishment findReplenishmentById(Integer id);
	List<Replenishment> findAllReplenishments();
	void saveReplenishment(Replenishment replenishment);
	void deleteReplenishment(Replenishment replenishment);
	List<Atm> find_All_ATM_DIEBOLD_NIXDORF();
	List<Replenishment> listReplenishmentAfterFiltring(Replenishment rplsh);
	
	

}
