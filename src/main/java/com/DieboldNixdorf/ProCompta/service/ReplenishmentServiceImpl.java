package com.DieboldNixdorf.ProCompta.service;

import java.util.List;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.DieboldNixdorf.ProCompta.dao.ReplenishmentDao;
import com.DieboldNixdorf.ProCompta.model.Atm;
import com.DieboldNixdorf.ProCompta.model.Replenishment;

@Service
@Transactional
public class ReplenishmentServiceImpl implements ReplenishmentService {

	@Autowired
	private ReplenishmentDao replenishmentDao;
	
	@Override
	public Replenishment findReplenishmentById(Integer id) {
		return replenishmentDao.findReplenishmentById(id);
	}

	@Override
	public List<Replenishment> findAllReplenishments() {
		return replenishmentDao.findAllReplenishments();
	}

	@Override
	public void saveReplenishment(Replenishment replenishment) {
		replenishmentDao.saveReplenishment(replenishment);

	}

	@Override
	public void deleteReplenishment(Replenishment replenishment) {
		replenishmentDao.deleteReplenishment(replenishment);

	}

	@Override
	public List<Atm> find_All_ATM_DIEBOLD_NIXDORF() {
		 
		return replenishmentDao.find_All_ATM_DIEBOLD_NIXDORF();
	}

	@Override
	public List<Replenishment> listReplenishmentAfterFiltring(Replenishment rplsh) {
	 
		return replenishmentDao.listReplenishmentAfterFiltring(rplsh);
	}

}
