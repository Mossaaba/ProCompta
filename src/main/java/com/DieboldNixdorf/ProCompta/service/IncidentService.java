package com.DieboldNixdorf.ProCompta.service;

import java.util.List;

import com.DieboldNixdorf.ProCompta.model.Incident;

public interface IncidentService {

	Incident findIncidentById(Integer id);
	List<Incident> findAllIncidents();
	void saveIncident(Incident incident);
	void deleteIncident(Incident incident);

}