package com.DieboldNixdorf.ProCompta.dao;

import java.util.List;

 
import com.DieboldNixdorf.ProCompta.model.RegeX;

public interface RegexDao {
	
	
	public List<RegeX> getAllRegeX();

	RegeX findById(int idRegeX);

	void saveRegeX(RegeX regeX);

	void deleteRegeXById(int idRegeX);

}
