package com.DieboldNixdorf.ProCompta.dao;

import java.util.List;

import com.DieboldNixdorf.ProCompta.model.Replenishment;

 

public interface ReplenishmentDao {
	
	
	Replenishment findReplenishmentById(Integer id);
	List<Replenishment> findAllReplenishments();
	void saveReplenishment(Replenishment replenishment);
	void deleteReplenishment(Replenishment replenishment);

}
