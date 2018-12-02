package com.DieboldNixdorf.ProCompta.dao;

 
 
import java.util.List;

import com.DieboldNixdorf.ProCompta.model.Incident;
 
 
 
public interface IncidentDao {
	
	
	Incident findIncidentById(Integer id);
	List<Incident> findAllIncidents();
	void saveIncident(Incident incident);
	void deleteIncident(Incident incident);
	
	
 

}
