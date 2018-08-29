package com.DieboldNixdorf.ProCompta.dao;

 
import java.sql.Date;
import java.sql.Time;
import java.util.List;

import com.DieboldNixdorf.ProCompta.model.Incident;
 
 
public interface IncidentDao {
	
	
	Incident findById(Integer id);
	List<Incident> findAll();
	List<String> listTypeIncident();
	
	
	List<Incident> listIncidentByFilter (Date DebutIncidentDate , Date finIncidentDate ,
			Time startingTimeIncident, Time fnisgingTimeIncident , String errorTransaction ) ;
	

}
