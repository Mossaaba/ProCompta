package com.DieboldNixdorf.ProCompta.dao;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.DieboldNixdorf.ProCompta.model.Transaction;
import com.DieboldNixdorf.ProCompta.tools.ToolsToUse;

@Repository("transactionDao")
public class TransactionDaoImpl implements TransactionDao {

	// private static final Logger logger =
	// Logger.getLogger(TransactionDaoImpl.class);

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Transaction findById(Integer idTransaction) {
		Session currentSession = sessionFactory.getCurrentSession();
		@SuppressWarnings("rawtypes")
		Query theQuery = currentSession.createQuery("from Transaction where idtransaction=:theTransactionId",
				Transaction.class);
		theQuery.setParameter("theTransactionId", idTransaction);
		Transaction transaction = (Transaction) theQuery.getSingleResult();
		return transaction;
	}

	@Override
	public List<Transaction> findAllTransaction() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<Transaction> theQuery = currentSession.createQuery("from Transaction", Transaction.class);
		List<Transaction> listTransactions = theQuery.getResultList();
		return listTransactions;
	}

	@Override
	public List<String> listErreursTransaction() {
		Session currentSession = sessionFactory.getCurrentSession();
		@SuppressWarnings("rawtypes")
		Query query = currentSession.createNativeQuery(
				"select distinct trx.error_transaction from Transaction trx where trx.error_transaction is not null");
		@SuppressWarnings("unchecked")
		List<String> listErreursTransaction = (List<String>) query.list();
		return listErreursTransaction;
	}

	@Override
	public List<String> listinfosTransaction() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveTrasanction(Transaction transaction) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(transaction);

	}
	@Override
	public void updateTransaction(Transaction transaction) {
	 
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.update(transaction);
	}
	@Override
	public void deleteTransaction(Transaction transaction) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.delete(transaction);

	}

	@Override
	public List<String> listATM() {
		Session currentSession = sessionFactory.getCurrentSession();

		@SuppressWarnings("rawtypes")
		Query query = currentSession.createNativeQuery(
				"select distinct trx.transaction_host_atm from Transaction trx where trx.transaction_host_atm is not null ");

		@SuppressWarnings("unchecked")
		List<String> listATMFromJrnHost = (List<String>) query.list();

		return listATMFromJrnHost;
	}

	@Override
	public List<Transaction> listTransactionAfterFiltring(Transaction trx) {

		Session currentSession = sessionFactory.getCurrentSession();

		CriteriaBuilder builder = currentSession.getCriteriaBuilder();
		CriteriaQuery<Transaction> query = builder.createQuery(Transaction.class);
		Root<Transaction> root = query.from(Transaction.class);
		query.select(root);

		final List<Predicate> predicates = new ArrayList<Predicate>();

		ToolsToUse tools = new ToolsToUse();
		/*---------------------------------------------------------------------------------------------------------*/
		/*---------------------------------------------------A T M ------------------------------------------------*/
		/*---------------------------------------------------------------------------------------------------------*/
		if (!trx.getTransactionHostATM().equalsIgnoreCase("-1"))

		{

			predicates.add(builder.like(root.get("transactionHostATM"), "%" + trx.getTransactionHostATM() + "%"));

		}
		/*---------------------------------------------------------------------------------------------------------*/
		/*------------------------------S T A R T I N G  D A T E ++ F I N I S H I N G  D A T E -------------------*/
		/*---------------------------------------------------------------------------------------------------------*/

		if (!trx.getTransactionDateStarting().equalsIgnoreCase("")
				|| !trx.getTransactionDateFinishing().equalsIgnoreCase("")) {

			if (trx.getTransactionDateFinishing().equalsIgnoreCase("")) {

				try {

					predicates.add(builder.greaterThanOrEqualTo(root.get("startingDate"),
							tools.convertStringToDatenew(trx.getTransactionDateStarting())));

				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			} else {

				try {

					predicates.add(builder.between(root.get("startingDate"),
							tools.convertStringToDatenew(trx.getTransactionDateStarting()),
							tools.convertStringToDatenew(trx.getTransactionDateFinishing())));

				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}

		}

		/*---------------------------------------------------------------------------------------------------------*/
		/*------------------------------S T A R T I N G    T I M E ++ F I N I S H I N G    T I M E  --------------*/
		/*---------------------------------------------------------------------------------------------------------*/
		if (!trx.getTransactionTimeFinishing().equalsIgnoreCase("")
				&& !trx.getTransactionTimeFinishing().equalsIgnoreCase("")) {

			try {

				predicates.add(builder.between(root.get("startingTime"),
						tools.ConvertStringToTimeTrx(trx.getTransactionTimeStarting()),
						tools.ConvertStringToTimeTrx(trx.getTransactionTimeFinishing())));

			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		/*---------------------------------------------------------------------------------------------------------*/
		/*------------------------------C A R D   N U M B E R PCI REQUIREMENT                       --------------*/
		/*---------------------------------------------------------------------------------------------------------*/
		if (!trx.getTransactionCardPartOne().equalsIgnoreCase("")
				&& (!(trx.getTransactionCardPartTwo().equalsIgnoreCase("")))) {

			predicates.add(builder.like(root.get("cardNumber"),
					"%" + trx.getTransactionCardPartOne() + "%" + trx.getTransactionCardPartTwo()));

			// query.where(builder.like(root.get("transactionHostCard"), "%" +
			// trx.getTransactionCardPartTwo() ));

		}
		/*---------------------------------------------------------------------------------------------------------*/
		/*------------------------------T R A N S A C T I O N       T Y P E                         --------------*/
		/*---------------------------------------------------------------------------------------------------------*/
		if (!trx.getTransactionType().equalsIgnoreCase("-1")) {

			if (trx.getTransactionType().equalsIgnoreCase("WITHDRAWAL")) {

				predicates.add(builder.like(root.get("transactionType"), trx.getTransactionType()));

			} else {
				predicates.add(builder.notLike(root.get("transactionType"), "WITHDRAWAL"));

			}

		}
		/*---------------------------------------------------------------------------------------------------------*/
		/*------------------------------A U T H O R I S A T I O N                                   --------------*/
		/*---------------------------------------------------------------------------------------------------------*/
		if (!trx.getTaransaction_AUTH().equalsIgnoreCase("")) {

			predicates.add(builder.equal(root.get("taransaction_AUTH"), trx.getTaransaction_AUTH()));

		}
		/*---------------------------------------------------------------------------------------------------------*/
		/*------------------------------T R A N S A C T I O N    A M O U N T   M I N & M A X        --------------*/
		/*---------------------------------------------------------------------------------------------------------*/
		if ((trx.getTransactionHostAmountMax() != 0) || (trx.getTransactionHostAmounttMin() != 0)) {

			if ((trx.getTransactionHostAmounttMin() != 0) && (trx.getTransactionHostAmountMax() == 0)) {

				predicates.add(builder.greaterThanOrEqualTo(root.get("transactionHostAmount"),
						trx.getTransactionHostAmounttMin()));

			}

			if ((trx.getTransactionHostAmounttMin() == 0) && (trx.getTransactionHostAmountMax() != 0)) {

				predicates.add(builder.lessThanOrEqualTo(root.get("transactionHostAmount"),
						trx.getTransactionHostAmountMax()));

			}

			if (!(trx.getTransactionHostAmounttMin() == 0) && !(trx.getTransactionHostAmountMax() == 0))

			{

				predicates.add(builder.between(root.get("transactionHostAmount"), trx.getTransactionHostAmounttMin(),
						trx.getTransactionHostAmountMax()));

			}

		}

		/*---------------------------------------------------------------------------------------------------------*/
		/*------------------------------C A R D   T A K E N                                         --------------*/
		/*---------------------------------------------------------------------------------------------------------*/
		if (!trx.getTransactionCardStatus().equalsIgnoreCase("-1")) {

			if (trx.getTransactionCardStatus().equalsIgnoreCase("true")) {

				predicates.add(builder.equal(root.get("cardTaken"), true));

			} else {

				predicates.add(builder.equal(root.get("cardTaken"), false));
			}
		}

		/*---------------------------------------------------------------------------------------------------------*/
		/*------------------------------    C A S H    T A K E N                                     --------------*/
		/*---------------------------------------------------------------------------------------------------------*/

		if (!trx.getTransactionCashStatus().equalsIgnoreCase("-1")) {

			if (trx.getTransactionCashStatus().equalsIgnoreCase("true")) {

				predicates.add(builder.equal(root.get("cashTaken"), true));

			} else {

				predicates.add(builder.equal(root.get("cashTaken"), false));

			}
		}

		/*---------------------------------------------------------------------------------------------------------*/
		/*----------------------------- E R R O R    T R A N S A C T I O N                           --------------*/
		/*---------------------------------------------------------------------------------------------------------*/

		if (!trx.getErrorTransaction().equalsIgnoreCase("-1")) {

			predicates.add(builder.like(root.get("errorTransaction"), trx.getErrorTransaction()));
		}
		query.where(builder.and(predicates.toArray(new Predicate[predicates.size()])));
		Query<Transaction> requet = currentSession.createQuery(query);
		List<Transaction> ListTransactionAfterFiltring = requet.getResultList();
		return ListTransactionAfterFiltring;
	}

	

}
