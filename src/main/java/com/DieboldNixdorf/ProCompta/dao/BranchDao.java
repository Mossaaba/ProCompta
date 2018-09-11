package com.DieboldNixdorf.ProCompta.dao;

import java.util.List;

 
import com.DieboldNixdorf.ProCompta.model.Branch;
 

 


public interface BranchDao {

    public List<Branch> getAllBranchs();
	 
    Branch findById(int idBranch);
  
    void saveBranch(Branch branch);
	
	void deleteBranchById(int idBranch);
	
	boolean isBranchUnique(Integer idBranch, String codeBranche);
	
	

}

