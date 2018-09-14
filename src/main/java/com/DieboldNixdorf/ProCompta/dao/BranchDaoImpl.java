package com.DieboldNixdorf.ProCompta.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.DieboldNixdorf.ProCompta.model.Bank;
import com.DieboldNixdorf.ProCompta.model.Branch;


@Repository("branchDao")
public class BranchDaoImpl implements BranchDao {

    static final Logger logger = LoggerFactory.getLogger(BranchDaoImpl.class);
	
	@Autowired 
	private SessionFactory sessionFactory; 
	
	
	@Override
	public Branch findById(int idBranch) {
		 
		 Session currentSession = sessionFactory.getCurrentSession();
		 @SuppressWarnings("rawtypes")
		 Query theQuery = currentSession.createQuery("from Branch where idbanque=:theBranchId" , Branch.class);
		 theQuery.setParameter("theBranchId", idBranch);
		 Branch branch =  (Branch) theQuery.getSingleResult();
		 return branch;
	}


	@Override
	public List<Branch> getAllBranchs() {
		
		 Session currentSession = sessionFactory.getCurrentSession();
		 Query<Branch> theQuery = currentSession.createQuery("from Branch " , Branch.class);
		 List<Branch> Branchs = theQuery.getResultList();
		 return Branchs;
	}
	
	
	@Override
	public void saveBranch(Branch branch) {
		 
		
		int theId = 1 ; 
		Session currentSession = sessionFactory.getCurrentSession();
		
		Bank bankTemp = currentSession.get(Bank.class, theId);
		bankTemp.add(branch);
		
		currentSession.saveOrUpdate(branch);	
		
	}

	@Override
	public void deleteBranchById(int idBranch) {
		 
		Session currentSession = sessionFactory.getCurrentSession();
		@SuppressWarnings("rawtypes")
		Query  theQuery = currentSession.createQuery("delete from Branch where idbanque=:theBranchId");
		theQuery.setParameter("theBranchId", idBranch);
		theQuery.executeUpdate();
		
	}

 

	@Override
	public boolean isBranchUnique(Integer idBranch, String codeBranche) {
		 
		return false;
	}

	

	 

}
