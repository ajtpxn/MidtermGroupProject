package com.skilldistillery.book2book.data;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
	
	//Map for login - getUserByUserNameAndPassword

	// CREATE NEW USER
	@Override
	public User creatUser(User user) {
		em.persist(user);
		em.flush();
		return user;
	}

	// UPDATE USER
	@Override
	public User updateUser(int id, User updatedUser) {
		User managedUser = em.find(User.class, id);
		managedUser.setFirstName(updatedUser.getFirstName());
		managedUser.setLastName(updatedUser.getLastName());
		managedUser.setFirstName(updatedUser.getFirstName());
		managedUser.setUserName(updatedUser.getUserName());
		managedUser.setPassword(updatedUser.getPassword());
		managedUser.setActive(updatedUser.isActive());

		return managedUser;
	}

	// DEACTIVATE USER
	@Override
	public boolean deleteUser(int id) {
		User deactivateUser = em.find(User.class, id);

		deactivateUser.setActive(false);

		if (deactivateUser.isActive() == false) {
			return true;
		} else {
			return false;
		}

		// LIST ALL COPIES BY USER ID
	}

	@Override
	public List<Copy> listAllUserBooks(int userId) {

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
		
		//String queryStr = "SELECT trans FROM Transaction trans JOIN FETCH trans."
		
		
		
		
		return null;
		
	}

	
// FIND USER BY ID
	@Override
	public User findUser(int id) {

		User user = em.find(User.class, id);

		return user;
	}
	
	
	// GET USER BY USERNAME AND PASSWORD
	@Override
	public User getUserByCredentials(String userName, String password) {
		List<User> userList = new ArrayList<User>();
		String query = "SELECT u FROM User u";
		userList = em.createQuery(query, User.class).getResultList();
		User returnUser = null;
		for (User user : userList) {
			if (user.getUserName().equals(userName) && user.getPassword().equals(password)) {
				System.out.println(user);
				returnUser = user;
				break;
			}
			else {
				System.out.println("Not found");
				
			}
		}
		return returnUser;
	}
}
	
	
