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
		em = emf.createEntityManager();
		em.getTransaction().begin();
		em.persist(t);
		em.flush();
		em.getTransaction().commit();
		em.close();
		return t;
	}

	@Override
	public Transaction getTransactionById(int id) {
		em = emf.createEntityManager();
		em.getTransaction().begin();
		Transaction t = em.find(Transaction.class, id);
		return t;
	}

	@Override
	public List<Transaction> getTransactionsByBorrowerId(int id) {
		em = emf.createEntityManager();
		em.getTransaction().begin();
		String query = "SELECT t FROM Transaction t WHERE t.borrow_id = :id";
		List<Transaction> result = em.createQuery(query, Transaction.class).setParameter("id", id).getResultList();

		return result;
	}

//	select * from copy_transaction 
//	join copy on copy.id = copy_transaction.copy_id
//	join user on copy.user_id = user.id
//	where user.id = 2;
	@Override
	public List<Transaction> getTransactionsByLenderId(int id) {
		em = emf.createEntityManager();
		String query = "SELECT trans FROM Transaction trans JOIN FETCH trans.copy WHERE  trans.copy.user.id = 2";
		List<Transaction> lenderTransactions = em.createQuery(query, Transaction.class).getResultList();

		em.close();
		return lenderTransactions;
	}

	@Override
	public List<Transaction> getTransactionsByCopyId(int id) {
		em = emf.createEntityManager();
		em.getTransaction().begin();
		String query = "SELECT t FROM Transaction t WHERE t.copyId = :id";
		List<Transaction> result = em.createQuery(query, Transaction.class).setParameter("id", id).getResultList();

		return result;
	}

	@Override
	public Transaction updateTransaction(int id, Transaction updated) {
		em = emf.createEntityManager();
		em.getTransaction().begin();
		Transaction managedTransaction = em.find(Transaction.class, "id");
		managedTransaction.setBorrowers(updated.getBorrowers());
		managedTransaction.setCopyId(updated.getCopyId());
		managedTransaction.setDateCreated(updated.getDateCreated());
		managedTransaction.setEndDate(updated.getDateCreated());
		managedTransaction.setStartDate(updated.getStartDate());
		return managedTransaction;
	}

	@Override
	public User getTransactionByCopyIdAndDate(int id, Date date) {
		em = emf.createEntityManager();
		em.getTransaction().begin();
		String query = "SELECT t FROM Transaction t WHERE t.copyId = :id AND t.startDate < :date AND t.endDate > :date";
		List<Transaction> result = em.createQuery(query, Transaction.class).setParameter("id", id)
				.setParameter("date", date).getResultList();
		if (result != null && result.size() > 0) {
			return result.get(0).getBorrowers();
		} else {
			return null;
		}
	}

}
