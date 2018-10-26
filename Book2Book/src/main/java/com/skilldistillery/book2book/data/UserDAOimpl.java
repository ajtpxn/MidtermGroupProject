package com.skilldistillery.book2book.data;



import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.skilldistillery.book2book.entities.Book;
import com.skilldistillery.book2book.entities.User;


@Transactional
@Component
public class UserDAOimpl implements UserDAO{
	
	 private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("Book2Book");
	 @PersistenceContext
	 private EntityManager em;

	 //CREATE NEW USER
	@Override
	public User creatUser(User user) {
		em = emf.createEntityManager();
		em.getTransaction().begin();
		
		em.persist(user);
		em.flush();
		
		em.getTransaction().commit();
		em.close();
		
		
		return user;
	}
	//UPDATE USER
	@Override
	public User updateUser(int id, User updatedUser) {
		em = emf.createEntityManager();
		em.getTransaction().begin();
		
		User managedUser = em.find(User.class, id);
		managedUser.setFirstName( updatedUser.getFirstName());
		managedUser.setLastName( updatedUser.getLastName());
		managedUser.setFirstName( updatedUser.getFirstName());
		managedUser.setUserName( updatedUser.getUserName());
		managedUser.setPassword( updatedUser.getPassword());
		managedUser.setActive( updatedUser.isActive());
		
		em.getTransaction().commit();
		em.close();
		
		return managedUser;
	}

	//DEACTIVATE USER 
	@Override
	public boolean deleteUser(int id) {
		em = emf.createEntityManager();
		em.getTransaction().begin();
		
		User deactivateUser = em.find(User.class, id);
		deactivateUser.setActive(false);
		
		if ( deactivateUser.isActive() == false) {
			em.getTransaction().commit();
			em.close();
			return true;
		}
		else {
			em.close();
			return false;
		}
		
	}
	@Override
	public List<Book> listAllUserBooks() {
		em = emf.createEntityManager();
		em.getTransaction().begin();
		
		String queryStr = "";//select statment and paramenters in createquery
		
		List<Book> userBookList = em.createQuery(queryStr, Book.class).getResultList();
		
		if( userBookList != null ) {
			return userBookList;
		}
		else {
			
			return null;
		}
		
	}

}