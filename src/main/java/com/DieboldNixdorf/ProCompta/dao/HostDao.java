package com.DieboldNixdorf.ProCompta.dao;

import java.util.List;
import com.DieboldNixdorf.ProCompta.model.Host;

public interface HostDao {

	List<Host> findAllHosts();

	Host findHostById(int idHost);

	void saveHost(Host host);

	void deleteHostById(int idHost);

}
