package com.skilldistillery.book2book.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.springframework.stereotype.Repository;
import com.skilldistillery.book2book.entities.Copy;


@Repository
public class CopyDAOImpl implements CopyDAO {
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("Book2Book");
	EntityManager em;
	
	
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
		em.getTransaction().commit();
		em.flush();
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
		List<Copy> copyList = new ArrayList<>();
		em.getTransaction().begin();
		String query = "SELECT c FROM Copy c WHERE userId = :userId";
		copyList = em.createQuery(query, Copy.class)
				.setParameter("id", userId)
				.getResultList();
		em.getTransaction().commit();
		em.close();
		return copyList;
	}
	
}
	

	

