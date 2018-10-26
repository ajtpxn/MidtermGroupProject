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
	public void editCopy(int conditionId, int id) {
		em = emf.createEntityManager();
		em.getTransaction().begin();
		Copy updatedCopy = em.find(Copy.class, id);
		updatedCopy.setConditionId(conditionId);
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
	public List<Copy> searchForCopy(int id) {
		em = emf.createEntityManager();
		List<Copy> copyList = new ArrayList<>();
		em.getTransaction().begin();
		String query = "select c from Copy c where concat(c.id, c.available, c.date_added, c.date_removed, c.user_id, c.book_id, c.active) like :search";
		
		copyList = em.createQuery(query, Copy.class).setParameter("id", "%"+id+"%").getResultList();
		em.getTransaction().commit();
		em.close();
		return copyList;
	}
	
}
	

	

