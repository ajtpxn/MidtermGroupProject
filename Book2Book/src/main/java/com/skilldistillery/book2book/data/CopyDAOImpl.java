package com.skilldistillery.book2book.data;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.book2book.entities.Condition;
import com.skilldistillery.book2book.entities.Copy;
import com.skilldistillery.book2book.entities.Transaction;

@Transactional
@Repository
public class CopyDAOImpl implements CopyDAO {

	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("Book2Book");
	@PersistenceContext
	private EntityManager em;

	@Override
	public Copy getCopy(int id) {
		Copy copy = em.find(Copy.class, id);
		return copy;
	}

	@Override
	public void addCopy(Copy copy) {
		em.persist(copy);
		em.flush();
	}

	@Override
	public void editCopy(Copy copy, int id) {
		Copy updatedCopy = em.find(Copy.class, id);
		updatedCopy.setCondition(copy.getCondition());
		updatedCopy.setAvailable(copy.isAvailable());
		updatedCopy.setActive(copy.isActive());
		em.flush();
	}

	@Override
	public void deleteCopy(int id) {
		Copy updatedCopy = em.find(Copy.class, id);
		updatedCopy.setActive(false);
	}

	@Override
	public List<Copy> listCopies() {
		List<Copy> copyList = new ArrayList<>();
		String query = "select c from Copy c ";
		copyList = em.createQuery(query, Copy.class).getResultList();
		return copyList;
	}

	@Override
	public List<Copy> listBookCopies(int bookId) {
		List<Copy> copyList = new ArrayList<>();
		String query = "SELECT c FROM Copy c WHERE bookId = :bookId";
		copyList = em.createQuery(query, Copy.class).setParameter("id", bookId).getResultList();
		return copyList;
	}

	@Override
	public List<Copy> listUserCopies(int userId) {
		System.out.println("listUserCopies");
		System.out.println("User ID: " + userId);
		List<Copy> copyList = new ArrayList<>();
		String query = "SELECT c FROM Copy c WHERE c.user.id = :userId AND c.active = true";
		copyList = em.createQuery(query, Copy.class).setParameter("userId", userId).getResultList();
		System.out.println("About to return");
		System.out.println(copyList);
		return copyList;
	}
	
	@Override
	public List<Copy> listBorrowerCopies(int userId) {
		System.out.println("listBorrowerCopies");
		System.out.println("User ID: " + userId);
		List<Transaction> transList = new ArrayList<>();
		String query = "SELECT t FROM Transaction t WHERE t.borrower.id = :userId";
		transList = em.createQuery(query, Transaction.class).setParameter("userId", userId).getResultList();
		List<Copy> copyList = new ArrayList<>();
		for (Transaction transaction : transList) {
			int copyID = transaction.getCopyId();
			Copy thisCopy = em.find(Copy.class, copyID);
			copyList.add(thisCopy);
		}
		System.out.println("About to return");
		System.out.println(transList);
		return copyList;
	}

	@Override
	public List<Copy> seeAllAvailableCopies(int userId) {
		String query = "SELECT c FROM Copy c WHERE c.available = true AND c.user.id != :id";
		List<Copy> availableBooks = em.createQuery(query, Copy.class).setParameter("id", userId).getResultList();
		return availableBooks;
	}

	@Override
	public List<Copy> listLimitedCopies() {
		String query = "SELECT c FROM Copy c";
		List<Copy> copies = em.createQuery(query, Copy.class).getResultList();
		Collections.shuffle(copies);
		List<Copy> output = new ArrayList<Copy>();
		for (int i = 0; i < Math.min(copies.size(), 5); i++) {
			output.add(copies.get(i));
		}
		return output;
	}

	public Condition findConditionbyID(int conditionId) {

		Condition condition = em.find(Condition.class, conditionId);

		return condition;

	}

}
