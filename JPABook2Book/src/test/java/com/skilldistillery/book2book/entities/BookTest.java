package com.skilldistillery.book2book.entities;


import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class BookTest {
	private  static EntityManagerFactory emf;
	private  EntityManager em;



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

	@Test
	@DisplayName("test book is linked to ")
	void test() {
		Book book = em.find(Book.class, 1);
		assertEquals("The Very Hungry Caterpillar", book.getTitle() );
	}

}
