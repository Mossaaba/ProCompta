package com.DieboldNixdorf.ProCompta.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.DieboldNixdorf.ProCompta.model.TransactionHost;

@Repository
public class TransactionHostDaoImpl extends AbstractDao<Integer, TransactionHost>  implements TransactionHostDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public TransactionHost findById(Integer idTransactionHost) {
		 
		return getByKey(idTransactionHost);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<TransactionHost> findAllTransaction() {
		Criteria crit = createEntityCriteria();
		return (List<TransactionHost>) crit.list();
	}

	@Override
	public int saveTransaction(TransactionHost transactionHost) {
		Session currentSession = sessionFactory.getCurrentSession();
		Integer idtransactionHost = (Integer) currentSession.save(transactionHost);
		return idtransactionHost;

	}
	@Override
	public void updateTransactionHost(TransactionHost transactionHost) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.update(transactionHost);
		
	}

	@Override
	public void deleteTransaction(Integer idTransactionHost) {
		TransactionHost transactionHost = getByKey(idTransactionHost);
		delete(transactionHost);

	}

	@Override
	public List<TransactionHost> listTransactionAfterFiltring(TransactionHost trxHost) {
		 
		return null;
	}

	

}
