package com.skilldistillery.book2book.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.skilldistillery.book2book.entities.Copy;
import com.skilldistillery.book2book.entities.Transaction;
import com.skilldistillery.book2book.entities.User;

@Transactional
@Component
public class UserDAOimpl implements UserDAO {

	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("Book2Book");
	@PersistenceContext
	private EntityManager em;

	// CREATE NEW USER
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

	// UPDATE USER
	@Override
	public User updateUser(int id, User updatedUser) {
		em = emf.createEntityManager();
		em.getTransaction().begin();

		User managedUser = em.find(User.class, id);
		managedUser.setFirstName(updatedUser.getFirstName());
		managedUser.setLastName(updatedUser.getLastName());
		managedUser.setFirstName(updatedUser.getFirstName());
		managedUser.setUserName(updatedUser.getUserName());
		managedUser.setPassword(updatedUser.getPassword());
		managedUser.setActive(updatedUser.isActive());

		em.getTransaction().commit();
		em.close();

		return managedUser;
	}

	// DEACTIVATE USER
	@Override
	public boolean deleteUser(int id) {
		em = emf.createEntityManager();
		em.getTransaction().begin();

		User deactivateUser = em.find(User.class, id);

		deactivateUser.setActive(false);

		if (deactivateUser.isActive() == false) {
			em.getTransaction().commit();
			em.close();
			return true;
		} else {
			em.close();
			return false;
		}

		// LIST ALL COPIES BY USER ID
	}

	@Override
	public List<Copy> listAllUserBooks(int userId) {
		em = emf.createEntityManager();

		String queryStr = "SELECT c FROM Copy c  JOIN FETCH c.book WHERE  c.user.id = :id";

		List<Copy> userBookList = em.createQuery(queryStr, Copy.class).setParameter("id", userId).getResultList();
		
		
		
	

			return userBookList;
		}
	
//	select * from transaction 
//	join copy on copy.id = transaction.copy_id
//	join user on copy.user_id = user.id
//	where user.id = 1;
//	//LIST ALL TRANSACTION BY USER ID
	public List<Transaction> listAllTransactionsByUserId( int userId){
		
		em = emf.createEntityManager();
		
		//String queryStr = "SELECT trans FROM Transaction trans JOIN FETCH trans."
		
		
		
		
		return null;
		
	}

	
// FIND USER BY ID
	@Override
	public User findUser(int id) {
		em = emf.createEntityManager();

		User user = em.find(User.class, id);
		
		
		em.close();

		return user;
	}

}
