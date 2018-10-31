package com.skilldistillery.book2book.data;

import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.book2book.entities.Transaction;
import com.skilldistillery.book2book.entities.User;

@Transactional
@Repository
public class TransactionDAOImpl implements TransactionDAO {

	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("Book2Book");
	@PersistenceContext
	private EntityManager em;

	@Override
	public Transaction makeTransaction(Transaction t) {
		em.persist(t);
		em.flush();
		return t;
	}

	@Override
	public Transaction getTransactionById(int id) {
		Transaction t = em.find(Transaction.class, id);
		return t;
	}

	@Override
	public List<Transaction> getTransactionsByBorrowerId(int id) {
		String query = "SELECT t FROM Transaction t WHERE t.borrower.id = :id";
		List<Transaction> result = em.createQuery(query, Transaction.class).setParameter("id", id).getResultList();
		System.out.println(result);
		return result;
	}

//	select * from copy_transaction 
//	join copy on copy.id = copy_transaction.copy_id
//	join user on copy.user_id = user.id
//	where user.id = 2;
	@Override
	public List<Transaction> getTransactionsByLenderId(int id) {
		String query = "SELECT trans FROM Transaction trans JOIN FETCH trans.copy WHERE  trans.copy.user.id = 2";
		List<Transaction> lenderTransactions = em.createQuery(query, Transaction.class).getResultList();
		return lenderTransactions;
	}

	@Override
	public List<Transaction> getTransactionsByCopyId(int id) {
		String query = "SELECT t FROM Transaction t WHERE t.copyId = :id";
		List<Transaction> result = em.createQuery(query, Transaction.class).setParameter("id", id).getResultList();

		return result;
	}

	@Override
	public Transaction updateTransaction(int id, Transaction updated) {
		Transaction managedTransaction = em.find(Transaction.class, id);
		managedTransaction.setBorrowers(updated.getBorrowers());
		managedTransaction.setCopyId(updated.getCopyId());
		managedTransaction.setDateCreated(updated.getDateCreated());
		managedTransaction.setEndDate(updated.getDateCreated());
		managedTransaction.setStartDate(updated.getStartDate());
		return managedTransaction;
	}

	@Override
	public User getBorrowerByCopyIdAndDate(int id, Date date) {
		String query = "SELECT t FROM Transaction t WHERE t.copyId = :id AND t.startDate < :date AND t.endDate > :date";
		List<Transaction> result = em.createQuery(query, Transaction.class).setParameter("id", id)
				.setParameter("date", date).getResultList();
		if (result != null && result.size() > 0) {
			return result.get(0).getBorrowers();
		} else {
			return null;
		}
	}

	@Override
	public List<Transaction> getSortedTransactionsByUserId(int id) {
		String query = "SELECT t FROM Transaction t JOIN Copy c ON t.copyId = c.id WHERE t.borrower.id = :id OR c.user.id = :id ORDER BY t.startDate";
		List<Transaction> result = em.createQuery(query, Transaction.class).setParameter("id", id).getResultList();
		return result;
	}

}
