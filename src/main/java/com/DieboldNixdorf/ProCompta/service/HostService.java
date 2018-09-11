package com.DieboldNixdorf.ProCompta.service;

import java.util.List;

import com.DieboldNixdorf.ProCompta.model.Host;

public interface HostService {
	
	
    Host findHostById(int idHost);
	
	void saveHost(Host host);
	
	void deleteHostById(int idHost);
	
	List<Host> findAllHosts();

}
