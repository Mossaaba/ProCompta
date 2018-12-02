package com.DieboldNixdorf.ProCompta.service;

import java.util.List;

import com.DieboldNixdorf.ProCompta.model.Replenishment;

public interface ReplenishmentService {
	
	Replenishment findReplenishmentById(Integer id);
	List<Replenishment> findAllReplenishments();
	void saveReplenishment(Replenishment replenishment);
	void deleteReplenishment(Replenishment replenishment);

}
