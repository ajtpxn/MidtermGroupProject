package com.skilldistillery.book2book.data;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.skilldistillery.book2book.entities.Copy;
import com.skilldistillery.book2book.entities.User;

class UserDAOTest {
	private  static EntityManagerFactory emf;
	private  EntityManager em;
	UserDAOimpl ud = new UserDAOimpl();

	@BeforeAll
	public static void setupALL() {
		emf =  Persistence.createEntityManagerFactory("Book2Book");
	}
	@AfterAll
	public static void tearDownALL() {
		emf.close();
	}
	@BeforeEach
	public void setUpBeforeClass() throws Exception {
			    em = emf.createEntityManager();
			   
	}
	@AfterEach
	public void tearDownAfterClass() throws Exception {
		em.close();
		
	}
	/*
	//TEST SEARCH USER BY ID
	@Test
	@DisplayName("find user by id")
	void test0() {
		User user = ud.findUser(1);
		
		assertEquals("User", user.getFirstName());
	}
	

	//TEST CREATING NEW USER
	@Test
	@DisplayName("Test crerate user adds useer to data base")
	void test() {
		User newUser = new User();
		newUser.setFirstName("kyle");
		newUser.setLastName("paladini");
		newUser.setUserName("kpaladini");
		newUser.setPassword("password");
		newUser.setActive(true);
		
		ud.creatUser(newUser);
		
		int id = newUser.getId();
		User inDBUser = em.find(User.class, id);
		assertEquals("kyle", inDBUser.getFirstName());
		
	}
	
	//TEST UPDATE USER
	@Test
	@DisplayName("Test edit update user in data base")
	void test2() {
		
		User oldUser = em.find(User.class, 2);
		
		User updatedUser = new User();
		updatedUser.setFirstName("changed");
		updatedUser.setLastName("paladini");
		updatedUser.setUserName("kpaladini");
		updatedUser.setPassword("password");
		updatedUser.setActive(true);
		
		ud.updateUser(2, updatedUser);
		
		assertEquals("changed", oldUser.getFirstName());
		
	}
	//TEST DEACTIVATE USER BY ID
	@Test
	@DisplayName("Test delete user in data base")
	void test3() {
		
		User user = em.find(User.class, 4);
		
		boolean deleted = ud.deleteUser(user.getId());
		
		
		assertTrue(deleted);
		assertFalse(user.isActive());
		
		
		
	}
	
	//TEST USER HAS A LIST OF COPIES
	@Test
	@DisplayName("Test get list of users copies")
	void test4() {
		
		
		List<Copy> userCopies = ud.listAllUserBooks(1);
		
		
		assertEquals(1, userCopies.size());
		assertEquals("The Very Hungry Caterpillar", userCopies.get(0).getBook().getTitle());
		
	}
	
	
	*/
	
	
	@Test
	@DisplayName("Test get user by Credentials")
	void test5() {
		User user = ud.getUserByCredentials("usermcuserface", "imauser");
		String name = user.getLastName();
		System.out.println(name);
		assertEquals("McUserface", name);
	}
	
	
	
	
}
