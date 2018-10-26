package com.skilldistillery.book2book.data;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.book2book.entities.Copy;
import com.skilldistillery.book2book.entities.User;

public class CopyDAOTest {
	static CopyDAO dao;
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("Book2Book");
	EntityManager em;
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
	}

	@BeforeEach
	void setUp() throws Exception {
		dao = new CopyDAOImpl();
		em = emf.createEntityManager();
	}

	@AfterEach
	void tearDown() throws Exception {
		dao = null;
		em.close();
	}
	
	@Test
	public void test_Copy_Add() throws ParseException {
		User user = new User();
		Copy copy = new Copy();
		copy.setAvailable(true);
		copy.setUser(user);
		copy.setActive(true);
		copy.setConditionId(1);
		dao.addCopy(copy);
		System.out.println(copy);
		Copy returnedCopy = em.find(Copy.class, copy.getId());
		assertEquals(1, returnedCopy.getUser());

	}
	
//	@Test
//	 void test_Copy_Update() {
//		List<Copy> copyList = new ArrayList<Copy>();
//		Copy editedCopy = em.find(Copy.class, 1);
//		editedCopy.setConditionId(2);
//		dao.editCopy(2, 1);
//		copyList = dao.searchForCopy(1);
//		int actual;
//		actual = copyList.get(0).getConditionId();
//		System.out.println(actual);
//		assertEquals(2, actual);
//	}
//
//	private boolean test_Copy_Delete() {
//		ActorDAO actorDAO = new ActorDAOImpl();
//		Scanner sc = new Scanner(System.in);
//		System.out.println("Enter an actor id to delete: ");
//		int id = sc.nextInt();
//		System.out.println(actorDAO.destroy(id));
//		return true;
//	}
}
