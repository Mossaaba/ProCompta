package com.DieboldNixdorf.ProCompta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.DieboldNixdorf.ProCompta.dao.BranchDao;
import com.DieboldNixdorf.ProCompta.model.Branch;

@Service("branchService")
@Transactional
public class BranchServiceImpl implements BranchService {

	@Autowired
    private BranchDao branchDao;

	@Override
	public List<Branch> getAllBranchs() {
		 
		return branchDao.getAllBranchs();
	}

	@Override
	public Branch findById(int idBranch) {
		 
		return branchDao.findById(idBranch);
	}

	@Override
	public void saveBranch(Branch branch) {
		
		      branchDao.saveBranch(branch);
	}

	@Override
	public void deleteBranchById(int idBranch) {
		
		      branchDao.deleteBranchById(idBranch);
	}

	@Override
	public boolean isBranchUnique(Integer idBranch, String codeBranche) {
		// TODO Auto-generated method stub
		return false;
	}
	
	 
}
