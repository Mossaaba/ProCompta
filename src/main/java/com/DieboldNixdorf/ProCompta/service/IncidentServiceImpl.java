package com.DieboldNixdorf.ProCompta.service;

import java.sql.Date;
import java.sql.Time;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.DieboldNixdorf.ProCompta.dao.IncidentDao;
import com.DieboldNixdorf.ProCompta.model.Incident;

@Service("incidentService")
public class IncidentServiceImpl implements IncidentService {
	
	
	IncidentDao incidentDao;
	
	
	@Autowired
	public void setIncidentDao(IncidentDao incidentDao) {
		this.incidentDao = incidentDao;
	}
	@Override
	public Incident findById(Integer id) {
		return incidentDao.findById(id);
	}
	@Override
	public List<Incident> findAll() {
		return incidentDao.findAll();
	}
	@Override
	public List<String> listTypeIncident() {
		 
		return  incidentDao.listTypeIncident();
	}
	
	@Override
	public List<Incident> listIncidentByFilter(Date DebutIncidentDate, Date finIncidentDate,
			Time startingTimeIncident, Time fnisgingTimeIncident, String errorTransaction) 
	{
		return incidentDao.listIncidentByFilter(DebutIncidentDate,  finIncidentDate,
				                               startingTimeIncident,  fnisgingTimeIncident, errorTransaction);
	}
	
	 
}