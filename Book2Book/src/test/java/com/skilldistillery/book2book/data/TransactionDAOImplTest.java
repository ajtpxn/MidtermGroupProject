package com.skilldistillery.book2book.data;

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

import com.skilldistillery.book2book.entities.Transaction;

class TransactionDAOImplTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private TransactionDAOImpl transactionDAO = new TransactionDAOImpl();

	@BeforeAll
	public static void setupALL() {
		emf = Persistence.createEntityManagerFactory("Book2Book");
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
	@DisplayName("Check that the getTransactionById method correctly retrieves a transaction")
	void test_getTransactionById_gets_correct_transaction() {
		Transaction transaction = transactionDAO.getTransactionById(1);
		assertEquals(transaction.getId(), 1);
	}

}
