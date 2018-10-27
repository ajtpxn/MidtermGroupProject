//package com.skilldistillery.book2book.controllers;
//
//import static org.junit.jupiter.api.Assertions.assertEquals;
//
//import org.junit.jupiter.api.AfterAll;
//import org.junit.jupiter.api.AfterEach;
//import org.junit.jupiter.api.BeforeAll;
//import org.junit.jupiter.api.BeforeEach;
//import org.junit.jupiter.api.DisplayName;
//import org.junit.jupiter.api.Test;
//
//import com.skilldistillery.book2book.data.UserDAO;
//import com.skilldistillery.book2book.data.UserDAOimpl;
//import com.skilldistillery.book2book.entities.User;
//
//class UserControllerTest {
//	
//	
//	
//	static UserController userContoller;
//	
//	static UserDAO userDAO;
//
//	@BeforeAll
//	static void setUpBeforeClass() throws Exception {
//	}
//
//	@AfterAll
//	static void tearDownAfterClass() throws Exception {
//	}
//
//	@BeforeEach
//	void setUp() throws Exception {
//		userContoller = new UserController();
//		userDAO = new UserDAOimpl();
//	}
//
//	@AfterEach
//	void tearDown() throws Exception {
//		userContoller = null;
//		userDAO = null;
//	}
//
//	@Test
//	@DisplayName("Test UserController addUser")
//	void test01() {
//		String actual = null;
//		
//		User user = new User();
//		
//		user.setActive(true);
//		user.setFirstName("James");
//		user.setLastName("Franco");
//		user.setPassword("alkejnvielskjoviwje");
//		user.setUserName("jamesfranco@franco.net");
//		
//		userContoller.addUser(user);
//		
//		actual = userDAO.findUser(6).getFirstName();
//		
//		assertEquals("James", actual);
//	}
//
//}
