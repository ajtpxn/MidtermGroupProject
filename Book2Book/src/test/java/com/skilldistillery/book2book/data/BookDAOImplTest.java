package com.skilldistillery.book2book.data;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.skilldistillery.book2book.entities.Author;
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

//	@Test
//	@DisplayName("Test search in BookDAO")
//	void test01() {
//		List<Book> bookList = new ArrayList<Book>();
//		bookList = dao.searchForBook("row");
//		String actual = bookList.get(0).getTitle();
//		System.out.println(actual);
//		assertEquals("Harry Potter and the Prisoner of Azkaban", actual);
//	}
	
	@Test
	@DisplayName("Test addBook in BookDAO")
	void test02() {
		Book book = new Book();
		Author author = new Author();
		author.setFirstName("Testauthor");
		author.setLastName("McAuthorface");
		
		book.setAuthor(author);
		book.setContentRatingId(1);
		book.setDescription("Test Description");
		book.setTitle("Test Book Title");
		System.out.println(book);
		dao.addBook(book);
		String actual = null;
		List<Book> bookList = dao.searchForBook("test");
		actual = bookList.get(0).getTitle();
		System.out.println(actual);
		assertEquals("Harry Potter and the Prisoner of Azkaban", actual);
	}
	
//	@Test
//	@DisplayName("Test editBook in BookDAO")
//	void test03() {
//		List<Book> bookList = new ArrayList<Book>();
//		bookList = dao.searchForBook("row");
//		String actual = bookList.get(0).getTitle();
//		System.out.println(actual);
//		assertEquals("Harry Potter and the Prisoner of Azkaban", actual);
//	}
	
//	@Test
//	@DisplayName("Test xyz in BookDAO")
//	void test04() {
//		List<Book> bookList = new ArrayList<Book>();
//		bookList = dao.searchForBook("row");
//		String actual = bookList.get(0).getTitle();
//		System.out.println(actual);
//		assertEquals("Harry Potter and the Prisoner of Azkaban", actual);
//	}

}
