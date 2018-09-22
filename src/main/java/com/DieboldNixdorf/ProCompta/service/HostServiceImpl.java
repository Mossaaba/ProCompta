package com.DieboldNixdorf.ProCompta.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.DieboldNixdorf.ProCompta.dao.HostDao;
import com.DieboldNixdorf.ProCompta.model.Host;

@Service("hostService")
@Transactional
public class HostServiceImpl implements HostService {

	@Autowired
	private HostDao hostDao;

	@Override
	public Host findHostById(int idHost) {
		return hostDao.findHostById(idHost);
	}

	@Override
	public void saveHost(Host host) {
		hostDao.saveHost(host);
	}

	@Override
	public void deleteHostById(int idHost) {
		hostDao.deleteHostById(idHost);
	}

	@Override
	public List<Host> findAllHosts() {

		return hostDao.findAllHosts();
	}

}
