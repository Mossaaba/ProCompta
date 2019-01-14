/**
 * 
 */
package com.DieboldNixdorf.ProCompta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.DieboldNixdorf.ProCompta.dao.HostFileDao;
import com.DieboldNixdorf.ProCompta.model.HostFile;

@Service("HostFileService")
@Transactional
public class HostFileServiceImpl implements HostFileService {

	@Autowired
	HostFileDao hostFileDao;
	@Override
	public List<HostFile> findAll() { 
		return hostFileDao.findAll();
	}
	@Override
	public HostFile findById(int idHostFile) { 
		return hostFileDao.findById(idHostFile);
	}
	@Override
	public int saveHostFile(HostFile hostFile) { 
		return hostFileDao.saveHostFile(hostFile);
	}
	@Override
	public void deleteById(int idHostFile) {
		hostFileDao.deleteById(idHostFile);
	}
	@Override
	public boolean HostFileExiste(String NameHostFile) 
	{
		return hostFileDao.HostFileExiste(NameHostFile);
	}
	@Override
	public List<String> ParseHostFile(MultipartFile multipartFile) {
		return hostFileDao.ParseHostFile(multipartFile);
	}

}
