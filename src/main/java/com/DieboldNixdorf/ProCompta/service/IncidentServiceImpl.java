package com.DieboldNixdorf.ProCompta.service;

 
import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.DieboldNixdorf.ProCompta.dao.IncidentDao;
import com.DieboldNixdorf.ProCompta.model.Incident;

@Service
@Transactional
public class IncidentServiceImpl implements IncidentService {

	@Autowired
	private IncidentDao IncidentDao;
	
	
	@Override
	public Incident findIncidentById(Integer id) {
		return IncidentDao.findIncidentById(id);
	}

	@Override
	public List<Incident> findAllIncidents() {
		return IncidentDao.findAllIncidents();
	}

	@Override
	public void saveIncident(Incident incident) {
		IncidentDao.saveIncident(incident);
		
	}

	@Override
	public void deleteIncident(Incident incident) {
		IncidentDao.deleteIncident(incident);
		
	}

	 
}