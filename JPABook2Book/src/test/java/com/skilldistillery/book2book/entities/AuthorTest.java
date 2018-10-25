package com.skilldistillery.book2book.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class AuthorTest {
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
	@DisplayName("author is linked to DB")
	void test() {
		
		Author author = em.find(Author.class, 1);
		assertEquals("Eric", author.getFirstName());
	}

}
