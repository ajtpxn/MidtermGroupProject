package com.skilldistillery.book2book.data;

import static org.junit.jupiter.api.Assertions.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.skilldistillery.book2book.entities.Book;

class BookDAOImplTest {
	static BookDAO dao;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
	}

	@BeforeEach
	void setUp() throws Exception {
		dao = new BookDAOImpl();
	}

	@AfterEach
	void tearDown() throws Exception {
		dao = null;
	}

	@Test
	@DisplayName("Test search in BookDAO")
	void test() {
		List<Book> bookList = new ArrayList<Book>();
		bookList = dao.searchForBook("row");
		String actual = bookList.get(0).getTitle();
		System.out.println(actual);
		assertEquals("Harry Potter and the Prisoner of Azkaban", actual);
	}

}
