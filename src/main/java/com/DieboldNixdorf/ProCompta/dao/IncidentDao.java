package com.DieboldNixdorf.ProCompta.dao;

 
 
import java.util.List;

import com.DieboldNixdorf.ProCompta.model.Atm;
import com.DieboldNixdorf.ProCompta.model.Incident;
 
 
 
 
public interface IncidentDao {
	
	
	Incident findIncidentById(Integer id);
	List<Incident> findAllIncidents();
	void saveIncident(Incident incident);
	void deleteIncident(Incident incident);
	List<Atm> find_All_ATM_DIEBOLD_NIXDORF();
	List<Incident> typeOfIncident();
	List<Incident> listincidentsAfterFiltring(Incident incd);

}
