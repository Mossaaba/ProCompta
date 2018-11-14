package com.DieboldNixdorf.ProCompta.service;

import java.util.List;

import com.DieboldNixdorf.ProCompta.model.Branch;

public interface BranchService {

	public List<Branch> getAllBranchs();

	Branch findById(int idBranch);

	void saveBranch(Branch branch);

	void deleteBranchById(int idBranch);

	boolean isBranchUnique(Integer idBranch, String codeBranche);

}
