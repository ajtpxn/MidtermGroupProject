package com.skilldistillery.book2book.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.skilldistillery.book2book.entities.Author;
import com.skilldistillery.book2book.entities.Book;
import com.skilldistillery.book2book.entities.ContentRating;
import com.skilldistillery.book2book.entities.Genre;

@Transactional
@Repository
public class BookDAOImpl implements BookDAO {
	EntityManagerFactory emf = Persistence.createEntityManagerFactory("Book2Book");
	@PersistenceContext
	EntityManager em;

	@Override
	public void addBook(Book book) {
		System.out.println("**************************************************");
		System.out.println(book);
		System.out.println("**************************************************");
		em.persist(book);
		em.flush();
	}

	@Override
	public Genre findGenreById(int id) {
		Genre genre = em.find(Genre.class, id);
		return genre;
	}

	@Override
	public ContentRating findContentRatingById(int id) {

		ContentRating rating = em.find(ContentRating.class, id);
		return rating;
	}

	@Override
	public void editBook(Book bookWithNewValues, int idOfBookToBeEdited) {
		Author managedAuthor = bookWithNewValues.getAuthor();

		Book updatedBook = em.find(Book.class, idOfBookToBeEdited);
		// USES AUTHOR MANAGED AUTHOR ABOVE
		updatedBook.setAuthor(managedAuthor);

		updatedBook.setContentRating(bookWithNewValues.getContentRating());
		updatedBook.setDescription(bookWithNewValues.getDescription());
		updatedBook.setTitle(bookWithNewValues.getTitle());
	}

	@Override
	public List<Book> searchForBookbyKeyword(String search) {
		List<Book> bookList = new ArrayList<>();
		String query = "select b from Book b where concat(b.title, b.description, b.author.firstName, b.author.lastName) like :search";
		bookList = em.createQuery(query, Book.class).setParameter("search", "%" + search + "%").getResultList();
		return bookList;
	}

	@Override
	public Book searchForBookByTitle(String title) {
		String query = "SELECT b FROM Book b where b.title like :title";
		Book book = em.createQuery(query, Book.class).setParameter("title", "%" + title + "%").getSingleResult();
		return book;

	}

	public List<Book> listAllBooks() {
		String query = "SELECT b FROM Book b";
		List<Book> books = em.createQuery(query, Book.class).getResultList();
		return books;

	}

	@Override
	public Book getBookById(int id) {
		Book book = em.find(Book.class, id);
		return book;

	}

}
