package com.DieboldNixdorf.ProCompta.service;

import java.util.List;

import com.DieboldNixdorf.ProCompta.model.RegeX;

public interface RegeXService {
	
	public List<RegeX> getAllRegeX();

	RegeX findById(int idRegeX);

	void saveRegeX(RegeX regeX);

	void deleteRegeXById(int idRegeX);

}
