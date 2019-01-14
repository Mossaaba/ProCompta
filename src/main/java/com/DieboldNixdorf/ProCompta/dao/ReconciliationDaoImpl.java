package com.DieboldNixdorf.ProCompta.dao;

import java.text.SimpleDateFormat;
 
import java.util.Date;
import java.util.List;

 

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.DieboldNixdorf.ProCompta.model.Reconciliation;

import com.DieboldNixdorf.ProCompta.model.Transaction;
import com.DieboldNixdorf.ProCompta.model.TransactionHost;

@Repository
public class ReconciliationDaoImpl extends AbstractDao<Integer, Reconciliation> implements ReconciliationDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Autowired
	TransactionDao trxDao;

	@Autowired
	TransactionHostDao trxHostDao;

	@Autowired
	ReconciliationDao reconDao;

	@Override
	public Reconciliation findReconciliationById(Integer idReconciliation) {
		return getByKey(idReconciliation);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Reconciliation> findAllReconciliations() {
		Criteria crit = createEntityCriteria();
		return (List<Reconciliation>) crit.list();
	}

	@Override
	public void saveReconciliation(Reconciliation reconciliation) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.save(reconciliation);
	}

	@Override
	public void deleteReconciliation(Reconciliation reconciliation) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.delete(reconciliation);

	}

	@Override
	public List<Object[]> listReconciliationsAfterFiltring() {

		Session currentSession = sessionFactory.getCurrentSession();

		@SuppressWarnings({ "deprecation", "rawtypes" })
		Query query = currentSession.createSQLQuery(""
				+ "  select t.idtransaction,th.idtransaction_host, t.card_number,t.utrnno,t.transaction_host_amount,t.transaction_host_atm, "
				+ "  th.transaction_card_number,th.transaction_authorization,th.transaction_amount,th.transaction_branch_acquire   "
				+ "  from transaction t  inner join transaction_host th  "
				+ "  on cast (th.transaction_amount AS DOUBLE PRECISION)= cast (t.transaction_host_amount AS DOUBLE PRECISION)"
				+ "  and cast (th.transaction_authorization AS DOUBLE PRECISION)=cast (t.utrnno AS DOUBLE PRECISION)"
				+ "  and th.transaction_branch_acquire=t.transaction_host_atm "
				+ "  and SUBSTRING ( th.transaction_card_number ,0 , 7 )=SUBSTRING ( t.card_number ,0 , 7 )"
				+ "  and SUBSTRING ( th.transaction_card_number ,13 , 4 )=SUBSTRING ( t.card_number ,13 , 4 )  "
				+ "  where ( flag_trx_host is null  and flag_trx is null    ) ");

		@SuppressWarnings("unchecked")
		List<Object[]> listTransaction = query.list();

		Reconciliation reconcilaition = new Reconciliation();

		Date dateToday = new Date();
		String timeNow = new  SimpleDateFormat("HH:mm:SS").format(new Date());

		for (Object[] row : listTransaction) {

			Transaction trx = trxDao.findById(Integer.parseInt(row[0].toString()));
			trx.setFlagTransactionHost(row[1].toString());
			reconcilaition.setIdTransaction(Integer.parseInt(row[0].toString()));
			reconcilaition.setJrnFile((trx.getJournal().getIdjournal()).toString());

			TransactionHost trxHost = trxHostDao.findById(Integer.parseInt(row[1].toString()));
			trxHost.setFlagTransaction(row[0].toString());
			reconcilaition.setIdTransactionHost(Integer.parseInt(row[1].toString()));
			reconcilaition.setHostFile((trxHost.getHostFile().getIdHostFile()).toString());
			reconcilaition.setDateReconciliation(dateToday);
			reconcilaition.setTypeReconciliation("Manuel");
			reconcilaition.setTimeReconciliation(timeNow);
			reconcilaition.setComment("Empty");

			trxDao.updateTransaction(trx);
			trxHostDao.updateTransactionHost(trxHost);
			reconDao.saveReconciliation(reconcilaition);

			reconcilaition = new Reconciliation();
			 

		}
		return listTransaction;
	}

	@Override
	public List<Transaction> listTransactionJrnNotReconcilied() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Transaction> theQuery = currentSession.createQuery("from Transaction where (flagTransactionHost is null and transactionType is not null)", Transaction.class);
		List<Transaction> ListTransactionJrnNotReconcilied = theQuery.getResultList();
		return ListTransactionJrnNotReconcilied;
		
	}

	@Override
	public List<TransactionHost> listTransactionHostNotReconcilied() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<TransactionHost> theQuery = currentSession.createQuery("from TransactionHost where flagTransaction is null ", TransactionHost.class);
		List<TransactionHost> ListTransactionHostNotReconcilied = theQuery.getResultList();
		return ListTransactionHostNotReconcilied;
		 
	}

	@Override
	public List<Object[]> listReconciliationsTransactionAndTransactionHost( ) {
		 
		List<Object[]> ReconciliationsTransactionAndTransactionHost;
	    Session session = sessionFactory.getCurrentSession();
	   

		 
	    
	    
	    @SuppressWarnings("unchecked")
		Query<Object[]> query = session.createQuery(" from Reconciliation r left JOIN Transaction trx on trx.idtransaction = r.idTransaction"
	    		+ "                                                        left JOIN TransactionHost trxh on trxh.idTransactionHost = r.idTransactionHost ");
	   
		
		
		
		ReconciliationsTransactionAndTransactionHost = query.list();
	    return ReconciliationsTransactionAndTransactionHost;
	}
	 
	@Override
	public Reconciliation findReconciliationByTransactionId(int idTransaction) {
		Session currentSession = sessionFactory.getCurrentSession();
		@SuppressWarnings("rawtypes")
		Query theQuery = currentSession.createQuery("from Reconciliation where idTransaction =:theTransactiontId", Reconciliation.class);
		theQuery.setParameter("theTransactiontId", idTransaction);
		Reconciliation reconciliation = (Reconciliation) theQuery.getSingleResult();
		return reconciliation;
	}

	@Override
	public Reconciliation findReconciliationByTransactionHostId(int idTransactionHost) {
		Session currentSession = sessionFactory.getCurrentSession();
		@SuppressWarnings("rawtypes")
		Query theQuery = currentSession.createQuery("from Reconciliation where idTransactionHost =:theTransactionHosttId", Reconciliation.class);
		theQuery.setParameter("theTransactionHosttId", idTransactionHost);
		Reconciliation reconciliation = (Reconciliation) theQuery.getSingleResult();
		return reconciliation;
	}

	@Override
	public List<Object[]> listReconciliationsTransactionAndTransactionHostFilter(Reconciliation reconciliation) {
		 
		
		List<Object[]> ReconciliationsTransactionAndTransactionHost;
	    Session session = sessionFactory.getCurrentSession();
		
	    StringBuilder sb = new StringBuilder();
		
		sb.append( " from Reconciliation r left JOIN Transaction trx on trx.idtransaction = r.idTransaction left "
				+ " JOIN TransactionHost trxh on trxh.idTransactionHost = r.idTransactionHost  where "); 
		
		
		if (!reconciliation.getStartingDateReconciliation().equalsIgnoreCase("") && !reconciliation.getFinishingDateReconciliation().equalsIgnoreCase("")) 
		{
			
			sb.append(" ( r.dateReconciliation >= '"+ reconciliation.getStartingDateReconciliation() +"' and  r.dateReconciliation  <= '"+reconciliation.getFinishingDateReconciliation()+"' ) and ");
			
			
		}
		
		if (!reconciliation.getTypeReconciliation().equalsIgnoreCase("-1"))
			
		{
			
			sb.append(" ( r.typeReconciliation = '"+reconciliation.getTypeReconciliation()+"' ) and ");
			
			
		}
		
		
        if (!reconciliation.getIndicatorHostorJrn().equalsIgnoreCase("-1"))
			
		{
			if (reconciliation.getIndicatorHostorJrn().equalsIgnoreCase("1"))
			{
			sb.append(" ( r.idTransaction  = '0' ) and ");
			}
			else 
			{
				
		    sb.append(" ( r.idTransactionHost  = '0' ) and ");
				
			}
			
			
		}
        
        sb.append(" ( 1=1 ) ");
        
        @SuppressWarnings("unchecked")
		Query<Object[]> query = session.createQuery(sb.toString());
        ReconciliationsTransactionAndTransactionHost = query.list();
	    return ReconciliationsTransactionAndTransactionHost;
        
        
		
		 
	}

}
