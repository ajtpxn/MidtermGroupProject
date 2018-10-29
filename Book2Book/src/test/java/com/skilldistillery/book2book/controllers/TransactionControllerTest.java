//package com.skilldistillery.book2book.controllers;
//
//import static org.junit.jupiter.api.Assertions.assertEquals;
//import static org.junit.jupiter.api.Assertions.fail;
//
//import java.util.List;
//
//import org.junit.jupiter.api.AfterAll;
//import org.junit.jupiter.api.AfterEach;
//import org.junit.jupiter.api.BeforeAll;
//import org.junit.jupiter.api.BeforeEach;
//import org.junit.jupiter.api.Test;
//
//import com.skilldistillery.book2book.data.TransactionDAO;
//import com.skilldistillery.book2book.data.TransactionDAOImpl;
//import com.skilldistillery.book2book.entities.Transaction;
//
//class TransactionControllerTest {
//	
//	static TransactionDAO transDAO;
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
//		transDAO = new TransactionDAOImpl();
//	}
//
//	@AfterEach
//	void tearDown() throws Exception {
//		transDAO = null;
//	}
//
//	@Test
//	void test() {
//		List<Transaction> tList = transDAO.getTransactionsByBorrowerId(10);
//		System.out.println(tList);
//		int actual = tList.get(0).getBorrowers();
//		
//		assertEquals("test", actual);
//
//	}
//
//}
