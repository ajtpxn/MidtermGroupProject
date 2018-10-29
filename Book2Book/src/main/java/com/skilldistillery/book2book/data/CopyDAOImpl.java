package com.skilldistillery.book2book.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.skilldistillery.book2book.entities.Copy;

@Transactional
@Repository
public class CopyDAOImpl implements CopyDAO {
	
	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("Book2Book");
	@PersistenceContext
	private EntityManager em;
	
	
	
	
	@Override
	public Copy getCopy(int id) {
		em = emf.createEntityManager();
		Copy copy = em.find(Copy.class, id);
		em.close();
		return copy;
	}
	
	
	
	@Override
	public void addCopy(Copy copy) {
		em = emf.createEntityManager();
		em.getTransaction().begin();
		em.persist(copy);
		em.flush();
		em.getTransaction().commit();
		em.close();
	}
	
	
	@Override
	public void editCopy(Copy copy, int id) {
		em = emf.createEntityManager();
		em.getTransaction().begin();
		Copy updatedCopy = em.find(Copy.class, id);
		updatedCopy.setConditionId(copy.getConditionId());
		updatedCopy.setAvailable(copy.isAvailable());
		updatedCopy.setActive(copy.isActive());
		em.flush();
		em.getTransaction().commit();
		em.close();
	}
	
	
	@Override
	public void deleteCopy(int id) {
		em = emf.createEntityManager();
		em.getTransaction().begin();
		Copy updatedCopy = em.find(Copy.class, id);
		updatedCopy.setActive(false);
		em.getTransaction().commit();
		em.close();
	}


	@Override
	public List<Copy> listCopies() {
		em = emf.createEntityManager();
		List<Copy> copyList = new ArrayList<>();
		em.getTransaction().begin();
		String query = "select c from Copy c ";
		copyList = em.createQuery(query, Copy.class).getResultList();
		em.getTransaction().commit();
		em.close();
		return copyList;
	}
	
	@Override
	public List<Copy> listBookCopies(int bookId){
		em = emf.createEntityManager();
		List<Copy> copyList = new ArrayList<>();
		em.getTransaction().begin();
		String query = "SELECT c FROM Copy c WHERE bookId = :bookId";
		copyList = em.createQuery(query, Copy.class)
				.setParameter("id", bookId)
				.getResultList();
		em.getTransaction().commit();
		em.close();
		return copyList;
	}
	
	@Override
	public List<Copy> listUserCopies(int userId){
		em = emf.createEntityManager();
		System.out.println("listUserCopies");
		System.out.println("User ID: " + userId);
		List<Copy> copyList = new ArrayList<>();
		String query = "SELECT c FROM Copy c WHERE c.user.id = :userId AND c.active = true";
		copyList = em.createQuery(query, Copy.class).setParameter("userId", userId).getResultList();
		em.close();
		System.out.println("About to return");
		System.out.println(copyList);
		return copyList;
	}

	public List<Copy> seeAllAvailableCopies() {
		em = emf.createEntityManager();
		
		String query = "SELECT c FROM Copy c WHERE c.available = true";
		List<Copy> availableBooks = em.createQuery(query, Copy.class).getResultList();
		
		
		
		return availableBooks;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
	

	

