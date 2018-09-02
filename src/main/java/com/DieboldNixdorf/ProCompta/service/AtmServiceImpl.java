package com.DieboldNixdorf.ProCompta.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.DieboldNixdorf.ProCompta.dao.AtmDao;
import com.DieboldNixdorf.ProCompta.model.Atm;


@Service
public class AtmServiceImpl implements AtmService {

	
	
	@Autowired 
	private AtmDao atmDao;
	
	
	
	@Override
	@Transactional
	public List<Atm> listAtms() {
		 
		return atmDao.listAtms() ;
	}
	
	
	

}
